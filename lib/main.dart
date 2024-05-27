import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:sampleproject/core/AppPreference.dart';
import 'package:sampleproject/core/colors.dart';
import 'package:sampleproject/login_page_activity.dart';
import 'package:sampleproject/size_config.dart';
import 'onboard_parent_page_activity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) =>  const OnBoardingParentActivity(),
        '/dashboard': (BuildContext context) =>   LoginPageActivity(),
      },
      home:  OnboardingScreen(),
    );
  }
}


class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _MyHomePageState();



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingParentActivity(),
    );
  }


}

class _MyHomePageState extends State<OnboardingScreen>  {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    getDeviceType();
    getDeviceID();
    getAppVersion();
  }

  /*Function for get Device Type is IOS or androoid*/
  getDeviceType() {
    if (Platform.isAndroid) {
      AppPreferences.setDeviceType("2");

    } else if (Platform.isIOS) {
      print("getDeviceType...");

      AppPreferences.setDeviceType("1");
    }
  }

  getDeviceID()   {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      deviceInfo.iosInfo.then((iosInfo) {
        AppPreferences.setDeviceId(iosInfo.identifierForVendor.toString());
      });
    } else {
      deviceInfo.androidInfo.then((androidInfo) {
        AppPreferences.setDeviceId(androidInfo.androidId.toString());

      });

    }

  }

  /*set app version*/
  getAppVersion() {

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      AppPreferences.setAppVersion(version);
    });
  }
  String sessionTokan="";
  startTimer() async {
    var duration =   const Duration(seconds: 8);
    try {
      String accessToken = await AppPreferences.getSessionToken();

      String userId = await AppPreferences.getUserId();

      print(userId);
      print("accessTokennnnnn       $accessToken  ");
      if (accessToken!="" &&accessToken!=null) {
        AppPreferences.setSessionToken(accessToken);
        return Timer(duration, dashboardParentPage);
      }else{
        return Timer(duration, navigatePreLoginParentPage);
      }
    } catch (e) {
      print("errorss    $e");
    }
    return Timer(duration, navigatePreLoginParentPage);
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: CommonColor.WHITE_COLOR,
      body: getAddNameLayout(SizeConfig.screenHeight,SizeConfig.screenWidth),
    );
  }
  /* Widget for Add Name Layout */
  Widget getAddNameLayout(double parentHeight, double parentWidth){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(
                //   height: parentHeight,
                //   width: parentWidth,
                //   image: AssetImage('assets/images/sia_splash.gif'),
                //   fit: BoxFit.cover,
                // ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: parentHeight*.05),
              child: Text(
                "Demo",
                style: TextStyle(
                    color: CommonColor.BLACK,
                    fontSize: SizeConfig.blockSizeHorizontal*5.0,
                    fontFamily: 'Inter_Bold_Font',
                    fontWeight: FontWeight.w600
                ),
                textScaleFactor: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void navigatePreLoginParentPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }
  void dashboardParentPage() {
    Navigator.of(context).pushReplacementNamed('/dashboard');
  }




}



