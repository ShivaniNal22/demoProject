import 'dart:convert';

import 'package:sampleproject/data/fetch_exeption.dart';
import 'package:sampleproject/model/response/mobile_login_response.dart';
import 'package:http/http.dart'as http;


class APIService
    implements MobileLoginResponseInterface
{


  @override
  Future<MobileLoginResponse> fetchMobileLoginResponseDetails(String url, Map<String, dynamic> mapData) async {
    // TODO: implement fetchMobileLoginResponseDetails
    var abc = Uri.parse(url);
   late MobileLoginResponse _logInData;
    await http.post(abc, body: mapData).then((response) {
      final statusCode = response.statusCode;
      print("LoginWithMobileResponseModel     ${response.body}");

      if (statusCode != 200) {
        throw FetchDataException(
            "An error ocurred : [Status Code : $statusCode]");
      }
      try {
        final Map<String, dynamic> responseBody = json.decode(response.body) as Map<String, dynamic>;
        _logInData = MobileLoginResponse.fromMap(responseBody);
      } catch (Ex) {
        throw FetchDataException("An error ocurred : [Status Code : $Ex]");
      }
    });
    return _logInData;
  }


}















