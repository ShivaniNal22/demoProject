import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sampleproject/size_config.dart';
import 'package:sampleproject/successful_page_activity.dart';

import 'core/colors.dart';

class OTPPageActivity extends StatefulWidget {

  const OTPPageActivity({Key? key}) : super(key: key);

  @override
  State<OTPPageActivity> createState() => _OTPPageActivityState();
}

class _OTPPageActivityState extends State<OTPPageActivity> {

  final otpFocus = FocusNode();
  final otpController = TextEditingController();
  String currentText = "";

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

                  getAddSubTextLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddMobileNumber(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddOtpFieldLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                  getAddResendButtonLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
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
      padding:  EdgeInsets.only(left: parentWidth*.035,right: parentWidth*.065,top: parentHeight*.025),
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

  /* Widget for Sub Text Layout */
  Widget getAddSubTextLayout(double parentHeight, double parentWidth){
    return Padding(
      padding:  EdgeInsets.only( left: parentWidth * .065,
          right: parentWidth * .065,top: parentHeight*.01),
      child: Row(
        children: [
          Text(
            "Enter your OTP",
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

  /* Widget for Mobile Number Layout */
  Widget getAddMobileNumber(double parentHeight, double parentWidth){
    return Padding(
      padding:  EdgeInsets.only( left: parentWidth * .065,
          right: parentWidth * .065,top: parentHeight*.005),
      child: Row(
        children: [
          Text(
            "99******89",
            style: TextStyle(
              color: CommonColor.BORDER_COLOR,
              fontSize: SizeConfig.blockSizeHorizontal*4.5,
              fontWeight: FontWeight.w400,
            ),
            textScaler: const TextScaler.linear(0.8),
          ),
        ],
      ),
    );
  }

  /* Widget for OTP field */
  Widget getAddOtpFieldLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          left: parentWidth * .065,
          right: parentWidth * .3,
          top: parentHeight * .02),
      child: PinCodeTextField(
        appContext: context,
        scrollPadding: EdgeInsets.only(bottom: parentHeight*.2),
        pastedTextStyle: const TextStyle(
          backgroundColor: Colors.transparent,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        length: 4,
        focusNode: otpFocus,
        obscureText: false,
        blinkWhenObscuring: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            selectedFillColor: CommonColor.TEXT_FIELD_BG_COLOR,
            inactiveFillColor: CommonColor.TEXT_FIELD_BG_COLOR,
            disabledColor: Colors.transparent,
            activeColor: Colors.grey.shade100,
            selectedColor: Colors.grey.shade100,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: parentHeight * .07,
            fieldWidth: parentHeight * .07,
            activeFillColor: CommonColor.BORDER_COLOR,
            inactiveColor: CommonColor.BORDER_COLOR),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 100),
        enableActiveFill: true,
        // errorAnimationController: errorController,
        controller: otpController,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          debugPrint("Completed");
          otpFocus.unfocus();
        },
        onChanged: (value) {
          debugPrint(value);
          setState(() {
            currentText = value;
          });
        },
        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          return true;
        },
      ),
    );
  }

  /* Widget for Resend Button Layout */
  Widget getAddResendButtonLayout(double parentHeight, double parentWidth){
    return Padding(
      padding:  EdgeInsets.only(  left: parentWidth * .065,
          right: parentWidth * .065,top: parentHeight*.0),
      child: Container(
        height: parentHeight*.03,
        color: Colors.transparent,
        child: Row(
          children: [
            Text(
              "Resend",
              style: TextStyle(
                color: CommonColor.THEME_COLOR,
                fontSize: SizeConfig.blockSizeHorizontal*4.5,
                fontWeight: FontWeight.w400,
              ),
              textScaler: const TextScaler.linear(0.8),
            ),
          ],
        ),
      ),
    );
  }


  /* Widget for Next Button Layout */
  Widget getAddNextButtonLayout(double parentHeight, double parentWidth){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SuccessfulPageActivity()));
      },
      child: Padding(
        padding: EdgeInsets.only(  left: parentWidth * .065,
            right: parentWidth * .065, top: parentHeight * 0.02),
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


}
