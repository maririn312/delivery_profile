// ignore_for_file: constant_identifier_names

class AppConst {
  // MELON MOBILE VERSION
  static const APP_VERSION = '0.0.1';

  // AGORA RTC TOKEN
  static const AppId = 'f6dfae92a1a94a2a9e891ead2f4c52ab';
  static const AgoraToken =
      '007eJxTYHBPK112evH/0/L5a1ac3SLXdIBlyj/Re19ahZZZXNb6Ot9DgSHNLCUtMdXSKNEw0dIk0SjRMtXC0jA1McUozSTZ1Cgx6dWKkJSGQEYGI4ZqFkYGCATx2RhKUotLUosYGABfHiK9';
  static const AgoraChannel = 'tester';
  static int uid = 0;

  // PRODUCTION SERVICE URL
  static const URL_SOCKET = 'https://melon.mn/';
  static const URL_BACKEND_ROOT = 'https://melon.mn/api/';
  static const URL_BACKEND_POST_AUTH = '${URL_BACKEND_ROOT}auth/login';
  static const URL_BACKEND_LOGOUT = '${URL_BACKEND_ROOT}auth/logout';
  static const URL_BACKEND_USER_EXPERTS =
      '${URL_BACKEND_ROOT}user/home/experts';
  static const URL_BACKEND_PROFILE = '${URL_BACKEND_ROOT}user/profile';
  static const URL_BACKEND_GET_OTP = '${URL_BACKEND_ROOT}user/getOtpCode';
  static const URL_BACKEND_UNREAD_CHAT = '${URL_BACKEND_ROOT}user/chat/unread';
  static const URL_BACKEND_LIST_CHAT = '${URL_BACKEND_ROOT}user/chat/list';
  static const URL_BACKEND_SEARCH = '${URL_BACKEND_ROOT}search';
  static const URL_BACKEND_CREATE = '${URL_BACKEND_ROOT}user/create';
  static const URL_BACKEND_GET_OTP_RECOVERY =
      '${URL_BACKEND_ROOT}user/getOtpCodeOnRecovery';
  static const URL_BACKEND_FORGET = '${URL_BACKEND_ROOT}user/resetPassword';
  static const URL_BACKEND_CHECK_USER =
      '${URL_BACKEND_ROOT}user/checkUserRegistered';
  static const URL_BACKEND_POST_REGISTER = '${URL_BACKEND_ROOT}user/create';
  static const URL_BACKEND_CALL = '${URL_BACKEND_ROOT}expert/call';
  static const URL_BACKEND_CALL_CANCEL =
      '${URL_BACKEND_ROOT}expert/call/1415/cancel';
  static const URL_BACKEND_CALL_ACCEPT =
      '${URL_BACKEND_ROOT}expert/call/1418/accept';
}

// Headers Logout
// {
// 	"Response Cookies": {
// 		"M_SES": {
// 			"domain": ".melon.mn",
// 			"expires": "2023-05-07T17:47:28.000Z",
// 			"path": "/",
// 			"value": ""
// 		}
// 	}
// }