enum ErrorCode {
    INTERNAL_ERROR = 0;
    ILLEGAL_ARGUMENT = 1;
    VERIFICATION_FAILED = 2;
    NOT_ALLOWED_QR_CODE_LOGIN = 3;
    VERIFICATION_NOTICE_FAILED = 4;
    RETRY_LATER = 5;
    INVALID_CONTEXT = 100;
    APP_UPGRADE_REQUIRED = 101;
}

struct CheckPinCodeVerifiedResponse {

}

struct CheckPinCodeVerifiedRequest {
    1: string authSessionId;
}

struct CheckQrCodeVerifiedResponse {

}

struct CheckQrCodeVerifiedRequest {
    1: string authSessionId;
}

exception SecondaryQrCodeException {
    1: ErrorCode code;
    2: string alertMessage;
}

service SecondaryQrCodeLoginPermitNoticeService {
    CheckPinCodeVerifiedResponse checkPinCodeVerified(
        1: CheckPinCodeVerifiedRequest request,
    ) throws(1: SecondaryQrCodeException e);

    CheckQrCodeVerifiedResponse checkQrCodeVerified(
        1: CheckQrCodeVerifiedRequest request,
    ) throws(1: SecondaryQrCodeException e);
}