


import 'package:sampleproject/core/constant.dart';

class MobileLoginResponse {
  int status;
  String message;
  String userId;
  String sessionToken;
  String deviceType;
  String profileComplete;
  String otp;
  String serverUrl;
  String apiVer;

  MobileLoginResponse.fromMap(Map<String, dynamic> map)
      : status = map[Constant.STATUS] != null ? map[Constant.STATUS] : 0,
        message = map[Constant.MESSAGE] != null ? map[Constant.MESSAGE] .toString().trim(): "",

        userId = map[Constant.USER_ID]!=null?map[Constant.USER_ID].toString().trim():"",
        sessionToken = map[Constant.SESSION_TOKEN]!=null?map[Constant.SESSION_TOKEN].toString().trim():"",
        deviceType = map[Constant.DEVICE_TYPE]!=null?map[Constant.DEVICE_TYPE].toString().trim():"",
        profileComplete = map[Constant.PROFILE_COMPLETE]!=null?map[Constant.PROFILE_COMPLETE].toString().trim():"",

        otp =
        map[Constant.OTP] != null ? map[Constant.OTP] .toString().trim(): "",

        serverUrl =
        map[Constant.SERVER_URL] != null ? map[Constant.SERVER_URL] .toString().trim(): "",
        apiVer =
        map[Constant.API_VERSION] != null ? map[Constant.API_VERSION].toString().trim() : "";
}

abstract class MobileLoginResponseInterface {
  Future<MobileLoginResponse> fetchMobileLoginResponseDetails(
      String url, Map<String, dynamic> mapData);
}

