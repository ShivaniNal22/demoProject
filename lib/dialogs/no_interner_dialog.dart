import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sampleproject/core/colors.dart';
import 'package:sampleproject/core/internet_check.dart';
import 'package:sampleproject/size_config.dart';



class NoInternetConformationDialog extends StatefulWidget {
  final InternetCheckInterface? mListener;
  final String isFor;
  final Key? key;

  NoInternetConformationDialog({  this.mListener, required this.isFor, this.key})
      : super(key: key);

  @override
  _NoInternetConformationDialogState createState() => _NoInternetConformationDialogState();
}

class _NoInternetConformationDialogState extends State<NoInternetConformationDialog> {
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    startTimer();
  }

  Future startTimer() async {
    const oneSec = const Duration(seconds: 1);
    _timer =
        Timer.periodic(oneSec, (Timer timer) => checkInterNet());
  }

  checkInterNet() async {
    InternetConnectionStatus netStatus = await InternetChecker.checkInternet();
    if (netStatus == InternetConnectionStatus.connected) {
      _timer.cancel();
      Navigator.pop(context);
    }

  }
  late double pageTextSize;
  late double problemTextSize;
  late double returnTextSize;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return   Material(
      child: Container(
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image:  AssetImage('assets/images/whatsapp.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [CommonColor.HINT_TEXT_COLOR.withOpacity(0.95), CommonColor.TEXT_FIELD_BG_COLOR.withOpacity(0.9)],
                begin: const FractionalOffset(0.9, 0.0),
                end: const FractionalOffset(0.0, 0.9),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
            ),
          ),
          child: Container(
            child: Column(
              children: [
                getReloadingPageLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                getLogoLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
                getProblemTextLayout(),
                getAddReloadButtonLayout(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*get Reloading Page Layout*/
  Widget getReloadingPageLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight* 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Try reloading this page...",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.safeBlockHorizontal* 4.0,
                fontFamily: 'Avenir_Medium',
              ),
            ),
          ),
        ],
      ),
    );
  }
  /* get add Dr. Pradnya Logo Layout*/
  Widget getLogoLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight* .05),
      child: Image(
        image: AssetImage("assets/images/whatsapp.png"),
        height: parentHeight* .4,
        width: parentHeight* .4,
      ),
    );
  }
  /* get Problem Text Layout*/
  Widget getProblemTextLayout(){
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal* 3.0, right: SizeConfig.blockSizeHorizontal* 3.0,top: SizeConfig.blockSizeVertical* 2.0),
      child: Text(
        "If the problem persists let us know on our Discord page!",
        style: TextStyle(
          color: Colors.black,
          fontSize: SizeConfig.blockSizeVertical* 2.5,
          fontFamily: 'Avenir_Medium',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /*get New Container Layout*/
  Widget getAddReloadButtonLayout(){
    return GestureDetector(
      onTap: (){
        Navigator.pop(context,true);
      },
      onDoubleTap: (){},
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*15.0,left: SizeConfig.blockSizeHorizontal*8.5,right: SizeConfig.blockSizeHorizontal*8.5),
        child: Container(
          height: SizeConfig.blockSizeVertical*7.0,
          decoration: BoxDecoration(
              color: CommonColor.THEME_COLOR,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Center(
            child: Text(
              "Reload",
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.blockSizeVertical* 3.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();

    super.dispose();
  }

}

abstract class InternetCheckInterface {
  void netConformation(String isFor);
}


