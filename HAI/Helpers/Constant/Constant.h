//
//  Constant.h
//  HAI
//
//  Created by Dung Do on 9/18/16.
//  Copyright © 2016 Dung Do. All rights reserved.
//

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define APP_DELEGATE    ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#define USER_DEFAULT    [NSUserDefaults standardUserDefaults]

#define IS_IPHONE   [[[UIDevice currentDevice] model] isEqualToString:@"iPhone"]

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

#ifdef DEBUG
#   define DLOG(FORMAT, ...) printf("🔵%s[line %d]: %s🔵\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#   define ELOG(FORMAT, ...) printf("🔴%s[line %d]: %s🔴\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#   define DLOG(...)
#   define ELOG(...)
#endif

// API-------------------------------------------------------------------

#ifdef DEBUG
    #define API_LOGIN @"http://221.133.7.92:802/api/rest/login"
    #define API_LOGIN_SESSION @"http://221.133.7.92:802/api/rest/loginsession"
    #define API_LOGOUT @"http://221.133.7.92:802/api/rest/logout"
    #define API_CHECK_STAFF @"http://221.133.7.92:802/api/rest/checkStaff"
    #define API_UPLOAD_IMAGE @"http://221.133.7.92:801/upload/checkin"
    #define API_CHECK_IN @"http://221.133.7.92:802/api/rest/checkin"
    #define API_UPDATE_PRODUCT @"http://221.133.7.92:802/api/rest/updateproduct"
    #define API_SAVE_PRODUCT @"http://221.133.7.92:802/api/rest/sendcodeevent"
    #define API_TRACKING_PRODUCT @"http://221.133.7.92:802/api/rest/tracking"
    #define API_EVENT @"http://221.133.7.92:802/api/rest/loyaltyevent"
    #define API_EVENT_DETAIL @"http://221.133.7.92:802/api/rest/eventdetail"
    #define API_SUPPORT @"http://221.133.7.92:802/api/rest/msgtohai"
    #define API_USER_INFORMATION @"http://221.133.7.92:802/api/rest/userinfo"
    #define API_UPDATE_REG @"http://221.133.7.92:802/api/rest/updatereg"
    #define API_FIND_AGENCY @"http://221.133.7.92:802/api/rest/findagency"
    #define API_GET_NOTIFICATION @"http://221.133.7.92:802/api/rest/getnotification"
    #define API_FUNCTION_PRODUCT @"http://221.133.7.92:802/api/rest/functionproduct"
#else
    #define API_LOGIN @"http://api.nongduochai.vn/api/rest/login"
    #define API_LOGIN_SESSION @"http://api.nongduochai.vn/api/rest/loginsession"
    #define API_LOGOUT @"http://api.nongduochai.vn/api/rest/logout"
    #define API_CHECK_STAFF @"http://api.nongduochai.vn/api/rest/checkStaff"
    #define API_UPLOAD_IMAGE @"http://cskh.nongduochai.vn/upload/checkin"
    #define API_CHECK_IN @"http://api.nongduochai.vn/api/rest/checkin"
    #define API_UPDATE_PRODUCT @"http://api.nongduochai.vn/api/rest/updateproduct"
    #define API_SAVE_PRODUCT @"http://api.nongduochai.vn/api/rest/sendcodeevent"
    #define API_TRACKING_PRODUCT @"http://api.nongduochai.vn/api/rest/tracking"
    #define API_EVENT @"http://api.nongduochai.vn/api/rest/loyaltyevent"
    #define API_EVENT_DETAIL @"http://api.nongduochai.vn/api/rest/eventdetail"
    #define API_SUPPORT @"http://api.nongduochai.vn/api/rest/msgtohai"
    #define API_USER_INFORMATION @"http://api.nongduochai.vn/api/rest/userinfo"
    #define API_UPDATE_REG @"http://api.nongduochai.vn/api/rest/updatereg"
    #define API_FIND_AGENCY @"http://api.nongduochai.vn/api/rest/findagency"
    #define API_GET_NOTIFICATION @"http://api.nongduochai.vn/api/rest/getnotification"
    #define API_FUNCTION_PRODUCT @"http://api.nongduochai.vn/api/rest/functionproduct"
#endif

#define PARAM_USER @"user"
#define PARAM_TOKEN @"token"
#define PARAM_EXTENSION @"extension"
#define PARAM_IMAGE @"image"
#define PARAM_AGENCY @"agency"
#define PARAM_COMMENT @"comment"
#define PARAM_RECEIVER @"receiver"
#define PARAM_LATITUDE @"latitude"
#define PARAM_LONGTITUDE @"longitude"
#define PARAM_DATE @"date"
#define PARAM_CODE @"code"
#define PARAM_TYPE @"type"
#define PARAM_CONTENT @"content"
#define PARAM_PRODUCTS @"products"
#define PARAM_CODES @"codes"
#define PARAM_STATUS @"status"
#define PARAM_EVENT_ID @"eventId"
#define PARAM_REG_ID @"regId"
#define PARAM_SEARCH @"search"
#define PARAM_PAGENO @"pageno"

#define RESPONSE_ID @"id"
#define RESPONSE_MESSAGE @"msg"
#define RESPONSE_USER @"user"
#define RESPONSE_TOKEN @"token"
#define RESPONSE_FUNCTION @"function"
#define RESPONSE_ROLE @"Role"
#define RESPONSE_AVATAR @"avatar"
#define RESPONSE_SIGNATURE @"signature"
#define RESPONSE_STATUS @"status"
#define RESPONSE_PRODUCTS @"products"
#define RESPONSE_EVENTS @"events"
#define RESPONSE_EVENTS_ID @"eid"
#define RESPONSE_EVENTS_IMAGE @"eimage"
#define RESPONSE_EVENTS_NAME @"ename"
#define RESPONSE_EVENTS_TIME @"etime"
#define RESPONSE_EVENTS_DESCRIBE @"edescribe"
#define RESPONSE_EVENTS_AWARDS @"awards"
#define RESPONSE_EVENTS_PRODUCTS @"products"
#define RESPONSE_CODES @"codes"
#define RESPONSE_TYPE @"type"
#define RESPONSE_FULLNAME @"fullname"
#define RESPONSE_ADDRESS @"address"
#define RESPONSE_PHONE @"phone"
#define RESPONSE_BIRTHDAY @"birthday"
#define RESPONSE_AREA @"area"
#define RESPONSE_ECOUNT @"ecount"
#define RESPONSE_TOPICS @"topics"
#define RESPONSE_DATA @"data"
#define RESPONSE_TITLE @"title"
#define RESPONSE_AGENCES @"agences"
#define RESPONSE_NOTIFICATION @"notifications"
#define RESPONSE_PAGEMAX @"pagemax"
#define RESPONSE_TRACKING @"tracking"
#define RESPONSE_NAME @"name"

// PREFERENCE-------------------------------------------------------------------

#define PREF_ALRAEDY_LOGIN @"already_login"
#define PREF_USER @"user"
#define PREF_TOKEN @"token"
#define PREF_FUNCTION @"function"
#define PREF_ROLE @"role"
#define PREF_NEWFEED @"newfeed"
#define PREF_TOPICS @"topics"


