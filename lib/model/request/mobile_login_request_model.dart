import 'package:sampleproject/core/constant.dart';


class MobileLoginRequestModel {
  // Non-nullable fields
  final String _option;
  final String _deviceType;
  final String _deviceId;
  final String _appVersion;
  final String _mobile;
  final String _pushKey;

  // Constructor with initializer list to initialize _option
  MobileLoginRequestModel(
      this._deviceType,
      this._deviceId,
      this._appVersion,
      this._mobile,
      this._pushKey,) : _option = "login";

  // Getter for _option
  String get option => _option;

  // Getters for other fields
  String get deviceType => _deviceType;
  String get deviceId => _deviceId;
  String get appVersion => _appVersion;
  String get mobile => _mobile;
  String get pushKey => _pushKey;

  // Method to get map data
  Map<String, dynamic> getMapData() {
    Map<String, dynamic> mapData = Map<String, dynamic>();

    if (option.isNotEmpty) {
      mapData[Constant.OPTION] = option;
    } else {
      throw "option can't be null";
    }

    if (deviceType.isNotEmpty) {
      mapData[Constant.DEVICE_TYPE] = deviceType;
    } else {
      throw "deviceType can't be null";
    }

    if (deviceId.isNotEmpty) {
      mapData[Constant.DEVICE_ID] = deviceId;
    } else {
      throw "deviceId can't be null";
    }

    if (appVersion.isNotEmpty) {
      mapData[Constant.APP_VERSION] = appVersion;
    } else {
      throw "appVersion can't be null";
    }

    if (pushKey.isNotEmpty) {
      mapData[Constant.PUSH_KEY] = pushKey;
    } else {
      throw "pushKey can't be null";
    }

    if (mobile.isNotEmpty) {
      mapData[Constant.MOBILE] = mobile;
    } else {
      throw "mobile can't be null";
    }

    print("MobileLoginRequestModel   $mapData");

    return mapData;
  }
}
