enum ContactType {
    MID = 0;
    PHONE = 1;
    EMAIL = 2;
    USERID = 3;
    PROXIMITY = 4;
    GROUP = 5;
    USER = 6;
    QRCODE = 7;
    PROMOTION_BOT = 8;
    CONTACT_MESSAGE = 9;
    FRIEND_REQUEST = 10;
    REPAIR = 128;
    FACEBOOK = 2305;
    SINA = 2306;
    RENREN = 2307;
    FEIXIN = 2308;
    BBM = 2309;
    BEACON = 11;
}

enum ContactStatus {
    UNSPECIFIED = 0;
    FRIEND = 1;
    FRIEND_BLOCKED = 2;
    RECOMMEND = 3;
    RECOMMEND_BLOCKED = 4;
    DELETED = 5;
    DELETED_BLOCKED = 6;
}

enum ContactRelation {
    ONEWAY = 0;
    BOTH = 1;
    NOT_REGISTERED = 2;
}

enum FriendRequestStatus {
    NONE = 0;
    AVAILABLE = 1;
    ALREADY_REQUESTED = 2;
    UNAVAILABLE = 3;
}

enum ErrorCode {
    ILLEGAL_ARGUMENT = 0;
    AUTHENTICATION_FAILED = 1;
    DB_FAILED = 2;
    INVALID_STATE = 3;
    EXCESSIVE_ACCESS = 4;
    NOT_FOUND = 5;
    INVALID_MID = 9;
    NOT_A_MEMBER = 10;
    INVALID_LENGTH = 6;
    NOT_AVAILABLE_USER = 7;
    NOT_AUTHORIZED_DEVICE = 8;
    NOT_AUTHORIZED_SESSION = 14;
    INCOMPATIBLE_APP_VERSION = 11;
    NOT_READY = 12;
    NOT_AVAILABLE_SESSION = 13;
    SYSTEM_ERROR = 15;
    NO_AVAILABLE_VERIFICATION_METHOD = 16;
    NOT_AUTHENTICATED = 17;
    INVALID_IDENTITY_CREDENTIAL = 18;
    NOT_AVAILABLE_IDENTITY_IDENTIFIER = 19;
    INTERNAL_ERROR = 20;
    NO_SUCH_IDENTITY_IDENFIER = 21;
    DEACTIVATED_ACCOUNT_BOUND_TO_THIS_IDENTITY = 22;
    ILLEGAL_IDENTITY_CREDENTIAL = 23;
    UNKNOWN_CHANNEL = 24;
    NO_SUCH_MESSAGE_BOX = 25;
    NOT_AVAILABLE_MESSAGE_BOX = 26;
    CHANNEL_DOES_NOT_MATCH = 27;
    NOT_YOUR_MESSAGE = 28;
    MESSAGE_DEFINED_ERROR = 29;
    USER_CANNOT_ACCEPT_PRESENTS = 30;
    USER_NOT_STICKER_OWNER = 32;
    MAINTENANCE_ERROR = 33;
    ACCOUNT_NOT_MATCHED = 34;
    ABUSE_BLOCK = 35;
    NOT_FRIEND = 36;
    NOT_ALLOWED_CALL = 37;
    BLOCK_FRIEND = 38;
    INCOMPATIBLE_VOIP_VERSION = 39;
    INVALID_SNS_ACCESS_TOKEN = 40;
    EXTERNAL_SERVICE_NOT_AVAILABLE = 41;
    NOT_ALLOWED_ADD_CONTACT = 42;
    NOT_CERTIFICATED = 43;
    NOT_ALLOWED_SECONDARY_DEVICE = 44;
    INVALID_PIN_CODE = 45;
    NOT_FOUND_IDENTITY_CREDENTIAL = 46;
    EXCEED_FILE_MAX_SIZE = 47;
    EXCEED_DAILY_QUOTA = 48;
    NOT_SUPPORT_SEND_FILE = 49;
    MUST_UPGRADE = 50;
    NOT_AVAILABLE_PIN_CODE_SESSION = 51;
    EXPIRED_REVISION = 52;
    NOT_YET_PHONE_NUMBER = 54;
    BAD_CALL_NUMBER = 55;
    UNAVAILABLE_CALL_NUMBER = 56;
    NOT_SUPPORT_CALL_SERVICE = 57;
    CONGESTION_CONTROL = 58;
    NO_BALANCE = 59;
    NOT_PERMITTED_CALLER_ID = 60;
    NO_CALLER_ID_LIMIT_EXCEEDED = 61;
    CALLER_ID_VERIFICATION_REQUIRED = 62;
    NO_CALLER_ID_LIMIT_EXCEEDED_AND_VERIFICATION_REQUIRED = 63;
    MESSAGE_NOT_FOUND = 64;
    INVALID_ACCOUNT_MIGRATION_PINCODE_FORMAT = 65;
    ACCOUNT_MIGRATION_PINCODE_NOT_MATCHED = 66;
    ACCOUNT_MIGRATION_PINCODE_BLOCKED = 67;
    INVALID_PASSWORD_FORMAT = 69;
    FEATURE_RESTRICTED = 70;
    MESSAGE_NOT_DESTRUCTIBLE = 71;
    PAID_CALL_REDEEM_FAILED = 72;
    PREVENTED_JOIN_BY_TICKET = 73;
    SEND_MESSAGE_NOT_PERMITTED_FROM_LINE_AT = 75;
    SEND_MESSAGE_NOT_PERMITTED_WHILE_AUTO_REPLY = 76;
    SECURITY_CENTER_NOT_VERIFIED = 77;
    SECURITY_CENTER_BLOCKED_BY_SETTING = 78;
    SECURITY_CENTER_BLOCKED = 79;
    TALK_PROXY_EXCEPTION = 80;
    E2EE_INVALID_PROTOCOL = 81;
    E2EE_RETRY_ENCRYPT = 82;
    E2EE_UPDATE_SENDER_KEY = 83;
    E2EE_UPDATE_RECEIVER_KEY = 84;
    E2EE_INVALID_ARGUMENT = 85;
    E2EE_INVALID_VERSION = 86;
    E2EE_SENDER_DISABLED = 87;
    E2EE_RECEIVER_DISABLED = 88;
    E2EE_SENDER_NOT_ALLOWED = 89;
    E2EE_RECEIVER_NOT_ALLOWED = 90;
    E2EE_RESEND_FAIL = 91;
    E2EE_RESEND_OK = 92;
    HITOKOTO_BACKUP_NO_AVAILABLE_DATA = 93;
    E2EE_UPDATE_PRIMARY_DEVICE = 94;
    SUCCESS = 95;
    CANCEL = 96;
    E2EE_PRIMARY_NOT_SUPPORT = 97;
    E2EE_RETRY_PLAIN = 98;
    E2EE_RECREATE_GROUP_KEY = 99;
    E2EE_GROUP_TOO_MANY_MEMBERS = 100;
    SERVER_BUSY = 101;
    NOT_ALLOWED_ADD_FOLLOW = 102;
    INCOMING_FRIEND_REQUEST_LIMIT = 103;
    OUTGOING_FRIEND_REQUEST_LIMIT = 104;
    OUTGOING_FRIEND_REQUEST_QUOTA = 105;
    DUPLICATED = 106;
    BANNED = 107;
    NOT_AN_INVITEE = 108;
    NOT_AN_OUTSIDER = 109;
    EMPTY_GROUP = 111;
    EXCEED_FOLLOW_LIMIT = 112;
    UNSUPPORTED_ACCOUNT_TYPE = 113;
}

enum ContentType {
    NONE = 0;
    IMAGE = 1;
    VIDEO = 2;
    AUDIO = 3;
    HTML = 4;
    PDF = 5;
    CALL = 6;
    STICKER = 7;
    PRESENCE = 8;
    GIFT = 9;
    GROUPBOARD = 10;
    APPLINK = 11;
    LINK = 12;
    CONTACT = 13;
    FILE = 14;
    LOCATION = 15;
    POSTNOTIFICATION = 16;
    RICH = 17;
    CHATEVENT = 18;
    MUSIC = 19;
    PAYMENT = 20;
    EXTIMAGE = 21;
    FLEX = 22;
}

enum BotType {
    RESERVED = 0;
    OFFICIAL = 1;
    LINE_AT_0 = 2;
    LINE_AT = 3;
}

enum BuddyOnAirLabel {
    ON_AIR = 0;
    LIVE = 1;
}

struct AvatarProfile {
    1: string version;
    2: i64 updatedMillis; // Timestamp
}

struct Contact {
    1: string mid; // MID
    2: i64 createdTime; // Timestamp
    10: ContactType type;
    11: ContactStatus status;
    21: ContactRelation relation;
    22: string displayName;
    23: string phoneticName;
    24: string pictureStatus;
    25: string thumbnailUrl;
    26: string statusMessage;
    27: string displayNameOverridden;
    28: i64 favoriteTime;
    31: bool capableVoiceCall;
    32: bool capableVideoCall;
    33: bool capableMyhome;
    34: bool capableBuddy;
    35: i32 attributes;
    36: i64 settings;
    37: string picturePath;
    38: string recommendParams;
    39: FriendRequestStatus friendRequestStatus;
    40: string musicProfile;
    42: string videoProfile;
    43: map<string, string> statusMessageContentMetadata;
    44: AvatarProfile avatarProfile;
}

struct BuddyList {
    1: string classification;
    2: string displayName;
    3: i32 totalBuddyCount;
    4: list<Contact> popularContacts;
}

struct BuddyDetail {
    1: string mid;
    2: i64 memberCount;
    3: bool onAir;
    4: bool businessAccount;
    5: bool addable;
    6: set<ContentType> acceptableContentTypes;
    7: bool capableMyhome;
    8: bool freePhoneCallable;
    9: string phoneNumberToDial;
    10: bool needPermissionApproval;
    11: i32 channelId;
    12: string channelProviderName;
    13: i32 iconType;
    14: BotType botType;
    15: bool showRichMenu;
    16: i64 richMenuRevision;
    17: BuddyOnAirLabel onAirLabel;
    27: i32 onAirVersion;
    18: bool useTheme;
    19: string themeId;
    20: bool useBar;
    21: i64 barRevision;
    22: bool useBackground;
    23: string backgroundId;
    24: bool statusBarEnabled;
    25: i64 statusBarRevision;
    26: string searchId;
    28: bool blockable;
}

exception TalkException {
    1: ErrorCode code;
    2: string reason;
    3: map<string, string> parameterMap;
}

service BuddyService {
    list<BuddyList> getPopularBuddyLists(
        2: string language,
        3: string country,
    ) throws(1: TalkException e);

    BuddyDetail getBuddyDetail(
        4: string buddyMid,
    ) throws(1: TalkException e);

    list<Contact> getBuddyContacts(
        2: string language,
        3: string country,
        4: string classification,
        5: i32 fromIndex,
        6: i32 count,
    ) throws(1: TalkException e);
}