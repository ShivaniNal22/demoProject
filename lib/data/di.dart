

import 'package:sampleproject/data/services.dart';
import 'package:sampleproject/model/response/mobile_login_response.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  /*Initialize mobileLoginPresenterResponseRepository in service class */
  MobileLoginResponseInterface get mobileLoginPresenterResponseRepository =>
      APIService();




}