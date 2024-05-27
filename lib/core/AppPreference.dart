import 'package:shared_preferences/shared_preferences.dart';


class AppPreferences{

  /*get deviceId value in SharedPreferences*/
  static Future<String> getDeviceId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId") ?? '';
  }

  /*set deviceId value form SharedPreferences*/
  static setDeviceId(String deviceId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", deviceId);
  }

  /*get deviceType value in SharedPreferences*/
  static Future<String> getDeviceType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("deviceType") ?? '';
  }

  /*set deviceType value form SharedPreferences*/
  static setDeviceType(String deviceType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceType", deviceType);
  }

  /*get latitude value in SharedPreferences*/
  static Future<String> getLatitude() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("latitude") ?? '';
  }

  /*set latitude value form SharedPreferences*/
  static  setLatitude(String latitude) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("latitude", latitude);
  }

  /*get longitude value in SharedPreferences*/
  static Future<String> getLongitude() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("longitude") ?? '';
  }

  /*set longitude value form SharedPreferences*/
  static   setLongitude(String longitude) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("longitude", longitude);
  }


/*get userId value in SharedPreferences*/
  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId") ?? '';
  }

  /*set userId value form SharedPreferences*/
  static setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userId", userId);
  }


  /*get session token in shared preferences*/
  static Future<String> getSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("sessionToken") ?? "";
  }
  /*set session token in shared preferences*/
  static   setSessionToken(String sessionToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("sessionToken",sessionToken);
  }

  /*get email in shared preferences*/
  static Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email") ?? "";
  }
  /*set email in shared preferences*/
  static   setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email",email);
  }

  /*get FirstName in shared preferences*/
  static Future<String> getFirstName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("firstName") ?? "";
  }
  /*set FirstName in shared preferences*/
  static   setFirstName(String firstName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("firstName",firstName);

  }
  /*get lastName in shared preferences*/
  static Future<String> getLastName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lastName") ?? "";
  }
  /*set lastName in shared preferences*/
  static  setLastName(String lastName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lastName",lastName);
  }


  /*get mobile in shared preferences*/
  static Future<String> getMobile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("mobile") ?? "";
  }
  /*set mobile in shared preferences*/
  static   setMobile(String mobile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("mobile",mobile);
  }



  /*get zipcode in shared preferences*/
  static Future<String> getZipCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("zipcode") ?? "";
  }
  /*set zipcode in shared preferences*/
  static   setZipCode(String zipcode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("zipcode",zipcode);
  }


  /*set pushKey value in SharedPreferences*/
  static Future<String> getPushKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fbpKey") ?? '0';
  }

  /*get pushKey value form SharedPreferences*/
  static setPushKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fbpKey", key);
  }

  /*set app version value in SharedPreferences*/
  static Future<String> getAppVersion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("appVersion") ?? "";
  }

  /*get app version value form SharedPreferences*/
  static setAppVersion(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("appVersion", key);
  }

  /*set app version value in socialMediaId*/
  static Future<String> getSocialMediaId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("socialMediaId") ?? "";
  }

  /*get app version value form socialMediaId*/
  static setSocialMediaId(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("socialMediaId", key);
  }


  /*set generateBusinessCardStatus value in SharedPreferences*/
  static Future<bool> getBussniessCardStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("businessCard") ?? false;
  }

  /*get setBusinesssCardStatus value form SharedPreferences*/
  static setBusinessCardStatus(bool businessCard) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("businessCard", businessCard);
  }
  /*get start Date value*/
  static Future<String> getStartDateTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("startDate") ?? "";
  }

  /*set start date*/
  static setStartDateTime(String startDate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("startDate", startDate);
  }

  /*get start Date value*/
  static Future<String> getEndDateTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("endDate") ?? "";
  }

  /*set start date*/
  static setEndDateTime(String endDate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("endDate", endDate);
  }



  static clearAppPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("sessionToken");
    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("mobile");
    prefs.remove("email");
    prefs.remove("userId");
    prefs.remove("profilePic");
    prefs.remove("userType");
    prefs.remove("gender");
    prefs.remove("zipcode");
    prefs.remove("distance");
    prefs.remove("age");
    prefs.remove("dob");
    prefs.remove("profileComplete");
    prefs.remove("pDistance");
    prefs.remove("pAgeStart");
    prefs.remove("pAgeEnd");
    prefs.remove("planeId");
    prefs.remove("mLogInFrom");
    prefs.remove("startDate");
    prefs.remove("endDate");
//    prefs.remove("socialMediaId");

  }

}