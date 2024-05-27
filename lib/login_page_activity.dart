import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sampleproject/core/AppPreference.dart';
import 'package:sampleproject/core/commonwidget.dart';
import 'package:sampleproject/core/constant.dart';
import 'package:sampleproject/core/internet_check.dart';
import 'package:sampleproject/core/utils.dart';
import 'package:sampleproject/data/fetch_exeption.dart';
import 'package:sampleproject/model/presenter/mobile_login_presenter.dart';
import 'package:sampleproject/model/request/mobile_login_request_model.dart';
import 'package:sampleproject/model/response/mobile_login_response.dart';
import 'package:sampleproject/size_config.dart';

import 'core/colors.dart';
import 'otp_page_activity.dart';

class LoginPageActivity extends StatefulWidget {

  @override
  State<LoginPageActivity> createState() => _LoginPageActivityState();
}

class _LoginPageActivityState extends State<LoginPageActivity> implements MobileLoginPresenterInterface{

  final mobileFocus = FocusNode();
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final vehicleNumberFocus = FocusNode();
  final mobileController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final vehicleController = TextEditingController();
  bool isPhoneMsgValid = false;
  bool isPhoneValid = false;
  bool isNameMsgValid = false;
  bool isNameValid = false;
  bool isEmailMsgValid = false;
  bool isEmailValid = false;
  bool isVehicleMsgValid = false;
  bool isVehicleValid = false;
  String deviceId = "";

  late MobileLoginOtpPresenter _getMobileLoginRequestPresenter;
  bool isMobileFieldFocused = false;
  bool isNameFieldFocused = false;
  bool isEmailFocused = false;
  bool isVehicalFocused = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalInfo();
    mobileController.addListener(removeErrorOnMobile);
    nameController.addListener(removeErrorOnName);
    emailController.addListener(removeErrorOnEmail);
    vehicleController.addListener(removeErrorOnVehicle);
    _getMobileLoginRequestPresenter = MobileLoginOtpPresenter(this);
    mobileFocus.addListener(_handleFocusChange);
    nameFocus.addListener(_handleFocusChange);
    emailFocus.addListener(_handleFocusChange);
    vehicleNumberFocus.addListener(_handleFocusChange);

  }
  void _handleFocusChange() {
    setState(() {
      isMobileFieldFocused = mobileFocus.hasFocus;
      isNameFieldFocused = nameFocus.hasFocus;
      isEmailFocused = emailFocus.hasFocus;
      isVehicalFocused = vehicleNumberFocus.hasFocus;
    });
  }

  getLocalInfo() async {
    String deviceIdFor = await AppPreferences.getDeviceId();
    setState(() {
      deviceId = deviceIdFor;

    });
    print("getlocalinfodeviceId ${deviceId}");
  }


  removeErrorOnMobile() {
    if (mobileController.text
        .trim()
        .isNotEmpty) {
      if (mounted) {
        setState(() {
          isPhoneMsgValid = false;
          isPhoneValid = false;
        });
      }
    }
  }
  removeErrorOnName() {
    if (nameController.text
        .trim()
        .isNotEmpty) {
      if (mounted) {
        setState(() {
          isNameMsgValid = false;
          isNameValid = false;
        });
      }
    }
  }
  removeErrorOnEmail() {
    if (emailController.text
        .trim()
        .isNotEmpty) {
      if (mounted) {
        setState(() {
          isEmailMsgValid = false;
          isEmailValid = false;
        });
      }
    }
  }
  removeErrorOnVehicle() {
    if (vehicleController.text
        .trim()
        .isNotEmpty) {
      if (mounted) {
        setState(() {
          isVehicleMsgValid = false;
          isVehicleValid = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onDoubleTap: (){},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: SizeConfig.screenHeight*.1,
              child: getAddBackButtonLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
            ),
            Container(
              height: SizeConfig.screenHeight*.9,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  getAddWelcomeBackLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddSubTextLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddMobileNumberLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddNameLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddEmailLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddVehicleNumberLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddNextButtonLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* Widget for Back Button layout */
  Widget getAddBackButtonLayout(double parentHeight, double parentWidth){
    return Padding(
      padding:  EdgeInsets.only(left: parentWidth*.05,right: parentWidth*.05,top: parentHeight*.025),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: parentHeight*.035,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Widget for Welcome Back Layout */
  Widget getAddWelcomeBackLayout(double parentHeight, double parentWidth){
    return Padding(
      padding:  EdgeInsets.only(left: parentWidth*.08,right: parentWidth*.06,top: parentHeight*.025),
      child: Row(
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.blockSizeHorizontal*5.5,
              fontWeight: FontWeight.w400,
            ),
            textScaler: const TextScaler.linear(1.1),
          ),
        ],
      ),
    );
  }

  /* Widget for Sub Text Layout */
  Widget getAddSubTextLayout(double parentHeight, double parentWidth){
    return Padding(
      padding:  EdgeInsets.only(left: parentWidth*.08,right: parentWidth*.06,top: parentHeight*.01),
      child: Row(
        children: [
          Text(
            "Please fill out the details",
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.blockSizeHorizontal*5.5,
              fontWeight: FontWeight.w400,
            ),
            textScaler: const TextScaler.linear(0.8),
          ),
        ],
      ),
    );
  }

  /* Widget for Mobile Number Layout */
  Widget getAddMobileNumberLayout(double parentHeight, double parentWidth){
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(
              left: parentWidth * 0.08,
              right: parentWidth * 0.08,
              top: parentHeight * 0.01),
          child: TextField(
            controller: mobileController,
            maxLength: 10,
            focusNode: mobileFocus,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              counterText: '',
              hintText: "",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // More curved border
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // More curved border
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              filled: true,
              fillColor: mobileFocus.hasFocus ? CommonColor.THEME_COLOR.withOpacity(0.08) : Colors.transparent,
              labelText: 'Enter your mobile number*',
              labelStyle: const TextStyle(
                color: CommonColor.HINT_TEXT_COLOR,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjust padding as needed

            ),
            onEditingComplete: (){
              mobileFocus.unfocus();
              FocusScope.of(context).requestFocus(nameFocus);
            },
          ),

        ),
        Visibility(
          visible: isPhoneValid,
          child: Padding(
            padding: EdgeInsets.only(
                top: parentHeight * .02, right: parentWidth * .025),
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        isPhoneMsgValid = !isPhoneMsgValid;
                      });
                    }
                  },
                  child: Icon(Icons.error, color: Colors.red)),
            ),
          ),
        ),
        CommonWidget.getShowError(
            parentHeight * .05,
            parentWidth * .025,
            SizeConfig.blockSizeHorizontal * 2.5,
            isPhoneMsgValid,
            mobileController.text.trim().isEmpty
                ? "Mobile number is required"
                : "Please enter valid number"),

      ],
    );

  }

  /* Widget for Name Layout */
  Widget getAddNameLayout(double parentHeight, double parentWidth){
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(
              left: parentWidth * 0.08,
              right: parentWidth * 0.08,
              top: parentHeight * 0.02),
          child: TextField(
            controller: nameController,
            focusNode: nameFocus,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              counterText: '',
              hintText: "",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // More curved border
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // More curved border
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              filled: true,
              fillColor: nameFocus.hasFocus ? CommonColor.THEME_COLOR.withOpacity(0.08) : Colors.transparent,
              labelText: 'Enter your name*',
              labelStyle: const TextStyle(
                color: CommonColor.HINT_TEXT_COLOR,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjust padding as needed

            ),
            onEditingComplete: (){
              nameFocus.unfocus();
              FocusScope.of(context).requestFocus(emailFocus);
            },
          ),
        ),
        Visibility(
          visible: isNameValid,
          child: Padding(
            padding: EdgeInsets.only(
                top: parentHeight * .02, right: parentWidth * .025),
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        isNameMsgValid = !isNameMsgValid;
                      });
                    }
                  },
                  child: Icon(Icons.error, color: Colors.red)),
            ),
          ),
        ),
        CommonWidget.getShowError(
            parentHeight * .05,
            parentWidth * .025,
            SizeConfig.blockSizeHorizontal * 2.5,
            isNameMsgValid,
                 "Please enter name"
               ),
      ],
    );

  }


  /* Widget for Email Layout */
  Widget getAddEmailLayout(double parentHeight, double parentWidth){
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(
              left: parentWidth * 0.08,
              right: parentWidth * 0.08,
              top: parentHeight * 0.02),
          child: TextField(
            controller: emailController,
            focusNode: emailFocus,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              counterText: '',
              hintText: "",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // More curved border
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // More curved border
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              filled: true,
              fillColor: emailFocus.hasFocus ? CommonColor.THEME_COLOR.withOpacity(0.08) : Colors.transparent,
              labelText: 'Enter your email*',
              labelStyle: const TextStyle(
                color: CommonColor.HINT_TEXT_COLOR,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjust padding as needed

            ),
            onEditingComplete: (){
              emailFocus.unfocus();
              FocusScope.of(context).requestFocus(vehicleNumberFocus);
            },
          ),
        ),
        Visibility(
          visible: isEmailValid,
          child: Padding(
            padding: EdgeInsets.only(
                top: parentHeight * .02, right: parentWidth * .025),
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        isEmailMsgValid = !isEmailMsgValid;
                      });
                    }
                  },
                  child: Icon(Icons.error, color: Colors.red)),
            ),
          ),
        ),
        CommonWidget.getShowError(
            parentHeight * .05,
            parentWidth * .025,
            SizeConfig.blockSizeHorizontal * 2.5,
            isEmailMsgValid,
            emailController.text.trim().isEmpty
                ? "Please enter email"
                : "Please enter valid email"),
      ],
    );


  }

  /* Widget for Vehicle Number Layout */
  Widget getAddVehicleNumberLayout(double parentHeight, double parentWidth){
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(
              left: parentWidth * 0.08,
              right: parentWidth * 0.08,
              top: parentHeight * 0.02),
          child: TextField(
            controller:vehicleController,
            focusNode: vehicleNumberFocus,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              counterText: '',
              hintText: "",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // More curved border
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // More curved border
                borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
              ),
              filled: true,
              fillColor: vehicleNumberFocus.hasFocus ? CommonColor.THEME_COLOR.withOpacity(0.08) : Colors.transparent,
              labelText: 'Enter your vehicle number*',
              labelStyle: const TextStyle(
                color: CommonColor.HINT_TEXT_COLOR,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjust padding as needed

            ),
            onEditingComplete: (){
              vehicleNumberFocus.unfocus();
            },
          ),
        ),
        Visibility(
          visible: isVehicleValid,
          child: Padding(
            padding: EdgeInsets.only(
                top: parentHeight * .02, right: parentWidth * .025),
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        isVehicleMsgValid = !isVehicleMsgValid;
                      });
                    }
                  },
                  child: Icon(Icons.error, color: Colors.red)),
            ),
          ),
        ),
        CommonWidget.getShowError(
            parentHeight * .05,
            parentWidth * .025,
            SizeConfig.blockSizeHorizontal * 2.5,
            isVehicleMsgValid,
            vehicleController.text.trim().isEmpty
                ? "Please enter vehicle number"
                : "Please enter valid vehicle number"),
      ],
    );
  }

  /* Widget for Next Button Layout */
  Widget getAddNextButtonLayout(double parentHeight, double parentWidth){
    return GestureDetector(
      onTap: (){
        if (_validateFields()) {
          // If all fields are valid, navigate to OTP page
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OTPPageActivity()));
        }
       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OTPPageActivity()));
      },
      child: Padding(
        padding: EdgeInsets.only(left: parentWidth * 0.08, right: parentWidth * 0.08, top: parentHeight * 0.03),
        child: Container(
          alignment: Alignment.center,
          height: parentHeight*.065,
          decoration: BoxDecoration(
            color: CommonColor.THEME_COLOR,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "Next",
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal* 4.5,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }










  /* Validate all fields */
/* Validate all fields */
  bool _validateFields() {
    bool isValid = true;

    // Validate mobile number
    if (mobileController.text.trim().isEmpty|| !Util.isMobileValid(mobileController.text.trim())) {
      setState(() {
        isPhoneMsgValid = true;
        isPhoneValid = true;
      });
      isValid = false;
    } else {
      setState(() {
        isPhoneMsgValid = false;
        isPhoneValid = false;
      });
    }

    // Validate name
    if (nameController.text.trim().isEmpty) {
      setState(() {
        isNameMsgValid = true;
        isNameValid = true;
      });
      isValid = false;
    } else {
      setState(() {
        isNameMsgValid = false;
        isNameValid = false;
      });
    }

    // Validate email
    if (emailController.text.trim().isEmpty || !Util.isEmailValid(emailController.text.trim())) {
      setState(() {
        isEmailMsgValid = true;
        isEmailValid = true;
      });
      isValid = false;
    } else {
      setState(() {
        isEmailMsgValid = false;
        isEmailValid = false;
      });
    }

    // Validate vehicle number
    if (vehicleController.text.trim().isEmpty ||!Util.isValidIndianVehicleNumber(vehicleController.text.trim()) ) {
      setState(() {
        isVehicleMsgValid = true;
        isVehicleValid = true;
      });
      isValid = false;
    } else {
      setState(() {
        isVehicleMsgValid = false;
        isVehicleValid = false;
      });
    }

    return isValid;
  }










/* Use this api for login */
  callLoginApi() async {
    String mobile = mobileController.text.trim();
    String deviceId = await AppPreferences.getDeviceId();
    String deviceType = await AppPreferences.getDeviceType();
    String appVersion = await AppPreferences.getAppVersion();
    String pushKey = await AppPreferences.getPushKey();
    //print("sessionToken...$sessionToken...$appVersion");
    // print("userid       $userId");
    bool status = true;
    if (mounted) {
      setState(() {
        if (!Util.isMobileValid(mobile)) {
          status = false;
          isPhoneMsgValid = true;
          isPhoneValid = true;
          CommonWidget.onbordingErrorDialog(
              context, "Not a valid Phone Number", "Phone Login");
        }
      });
    }

    InternetConnectionStatus netStatus = await InternetChecker.checkInternet();

    if (status) {
      if (mounted){
        setState(() {
         // isLoaderShow = true;
        });
      }

      if (netStatus == InternetConnectionStatus.connected) {
        MobileLoginRequestModel model = MobileLoginRequestModel(
            deviceType,
            deviceId,
            appVersion,
            mobile,
            pushKey
        );
        _getMobileLoginRequestPresenter.callMobileLoginApi(
            Constant.getLogin(), model.getMapData());
      } else {
        if (mounted){
          setState(() {
           // isLoaderShow = false;
          });
        }
        CommonWidget.noInternetDialogNew(context);
      }
    }
  }

  @override
  void onMobileLoginPresenterError(FetchDataException e) {
    // TODO: implement onMobileLoginPresenterError
    if (mounted) {
      setState(() {
        //isLoaderShow = false;
      });
    }
    print("errrr   $e");
    CommonWidget.gotoErrorScreen(context);
  }

  @override
  void onMobileLoginPresenterSuccess(MobileLoginResponse item) {
    // TODO: implement onMobileLoginPresenterSuccess
    if (mounted) {
      setState(() {
       // isLoaderShow = false;
      });
    }
    int status = item.status;
    String msg = item.message;
    switch (status) {
      case 0:
        print("validate num");
        CommonWidget.onbordingErrorDialog(
            context, "Not a valid Phone Number", "Phone Login");
        break;
      case 1:


       // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => OTPPageActivity(
        //     sessionToken: item.sessionToken,
        //     userId:item.userId,
        //   )),
        //   // (Route<dynamic> route) => false,
        // );



        break;
      case 2:
       // CommonWidget.gotoLoginScreen(context);
        break;
    }
  }

}
