import os
import base64
import urllib.parse
import sys

from thrift.transport.THttpClient import THttpClient
from thrift.protocol.TCompactProtocol import TCompactProtocol
import axolotl_curve25519 as curve
from loguru import logger

from line_service.SecondaryQrCodeLoginService import SecondaryQrCodeLoginService
from line_service.SecondaryQrCodeLoginService.ttypes import (
    SecondaryQrCodeException,
    CreateQrSessionRequest,
    CreateQrSessionResponse,
    CreateQrCodeRequest,
    CreateQrCodeResponse,
    VerifyCertificateRequest,
    CreatePinCodeRequest,
    CreatePinCodeResponse,
    QrCodeLoginRequest,
    QrCodeLoginResponse,
)
from line_service.SecondaryQrCodeLoginPermitNoticeService import SecondaryQrCodeLoginPermitNoticeService
from line_service.SecondaryQrCodeLoginPermitNoticeService.ttypes import (
    CheckQrCodeVerifiedRequest,
    CheckQrCodeVerifiedResponse,
    CheckPinCodeVerifiedRequest,
    CheckPinCodeVerifiedResponse,
)


def setup_logger():
    log_format = (
        "<blue>{time:%s}:{process}</blue> <cyan>{name}:{line}</cyan> <level>{level: <8} | {message}</level>"
        % ("YYYY-MM-DD-HH:mm:ss.SSS")
    )

    logger.remove()
    logger.add(sys.stdout, level="INFO", colorize=True, format=log_format)
    # logger.add("logs/linelib.log", level="DEBUG", format=log_format, rotation="1 MB", retention=10)


host = "https://legy-jp-addr.line.naver.jp"
sqls = "/acct/lgn/sq/v1"
sqlpns = "/acct/lp/lgn/sq/v1"


def create_sqls_client() -> SecondaryQrCodeLoginService.Client:
    # SecondaryQrCodeLoginService -> sqls
    sqls_http_client = THttpClient(host + sqls)
    sqls_http_client.setCustomHeaders(
        {
            "X-Line-Application": "ANDROIDLITE\t2.13.2\tAndroid OS\t10.0;SECONDARY",
            "User-Agent": "LLA/2.13.2 Nexus 5X 10",
            "x-lal": "ja_jp",
        }
    )
    sqls_http_protocol = TCompactProtocol(sqls_http_client)
    return SecondaryQrCodeLoginService.Client(sqls_http_protocol)


def create_session(client: SecondaryQrCodeLoginService.Client) -> CreateQrSessionResponse:
    return client.createSession(CreateQrSessionRequest())


def create_qrcode(client: SecondaryQrCodeLoginService.Client, session_id: str) -> CreateQrCodeResponse:
    return client.createQrCode(CreateQrCodeRequest(session_id))


def get_qrcode_query():
    private_key = curve.generatePrivateKey(os.urandom(32))
    public_key = curve.generatePublicKey(private_key)

    secret = urllib.parse.quote(base64.b64encode(public_key).decode())
    version = 1
    return f"?secret={secret}&e2eeVersion={version}"


def create_sqlpns_client(session_id: str) -> SecondaryQrCodeLoginPermitNoticeService.Client:
    # SecondaryQrCodeLoginPermitNoticeService -> sqlpns
    sqlpns_http_client = THttpClient(host + sqlpns)
    sqlpns_http_client.setCustomHeaders(
        {
            "X-Line-Application": "ANDROIDLITE\t2.13.2\tAndroid OS\t10.0;SECONDARY",
            "User-Agent": "LLA/2.13.2 Nexus 5X 10",
            "x-lal": "ja_jp",
            "X-Line-Access": session_id,
        }
    )
    sqlpns_http_protocol = TCompactProtocol(sqlpns_http_client)
    return SecondaryQrCodeLoginPermitNoticeService.Client(sqlpns_http_protocol)


def check_qrcode(
    client: SecondaryQrCodeLoginPermitNoticeService.Client, session_id: str
) -> CheckQrCodeVerifiedResponse:
    return client.checkQrCodeVerified(CheckQrCodeVerifiedRequest(session_id))


def verify_certificate(client: SecondaryQrCodeLoginService.Client, session_id: str):
    client.verifyCertificate(VerifyCertificateRequest(session_id, ""))


def create_pincode(client: SecondaryQrCodeLoginService.Client, session_id: str) -> CreatePinCodeResponse:
    return client.createPinCode(CreatePinCodeRequest(session_id))


def check_pincode(
    client: SecondaryQrCodeLoginPermitNoticeService.Client, session_id: str
) -> CheckPinCodeVerifiedResponse:
    client.checkPinCodeVerified(CheckPinCodeVerifiedRequest(session_id))


def login(client: SecondaryQrCodeLoginService.Client, session_id: str) -> QrCodeLoginResponse:
    return client.qrCodeLogin(QrCodeLoginRequest(session_id, "test", autoLoginIsRequired=True))


def main():
    setup_logger()

    sqls_client = create_sqls_client()
    session_id = create_session(sqls_client).authSessionId

    qrcode = create_qrcode(sqls_client, session_id)
    logger.info("url: " + qrcode.callbackUrl + get_qrcode_query())

    sqlpns_client = create_sqlpns_client(session_id)
    check_qrcode(sqlpns_client, session_id)
    try:
        verify_certificate(sqls_client, session_id)
    except SecondaryQrCodeException:
        logger.warning("Certificate has expired")

        pincode = create_pincode(sqls_client, session_id)
        logger.info("pin: " + pincode.pinCode)

    check_pincode(sqlpns_client, session_id)
    response = login(sqls_client, session_id)

    logger.info(f"[*] Token: {response.accessToken}")
    logger.info(f"[*] Certificate: {response.certificate}")


if __name__ == "__main__":
    main()
