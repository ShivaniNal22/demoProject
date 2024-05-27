

import 'package:sampleproject/data/di.dart';
import 'package:sampleproject/data/fetch_exeption.dart';
import 'package:sampleproject/model/response/mobile_login_response.dart';

class MobileLoginOtpPresenter {
  final MobileLoginPresenterInterface _viewListener;
  final MobileLoginResponseInterface _mobileLoginPresenterResponseRepository;

  MobileLoginOtpPresenter(this._viewListener)
      : _mobileLoginPresenterResponseRepository = Injector().mobileLoginPresenterResponseRepository;

  void callMobileLoginApi(String url, Map<String, dynamic> map) {
    _mobileLoginPresenterResponseRepository
        .fetchMobileLoginResponseDetails(url, map)
        .then((data) => _viewListener.onMobileLoginPresenterSuccess(data))
        .catchError((e) => _viewListener.onMobileLoginPresenterError(FetchDataException(e)));
  }
}

abstract class MobileLoginPresenterInterface{
  void onMobileLoginPresenterSuccess(MobileLoginResponse item);
  void onMobileLoginPresenterError(FetchDataException e);
}