import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleproject/core/colors.dart';
import 'package:sampleproject/size_config.dart';



class ErrorScreen extends StatefulWidget {
  final ErrorScreenInterface? mListener;
  final Key? key;

  const ErrorScreen({  this.mListener, this.key}) : super(key: key);

  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      alignment:Alignment.center,
      children: [
        Material(
          child: Container(
            height: SizeConfig.screenHeight,
            /* decoration: BoxDecoration(
              image: DecorationImage(
                  image:  new AssetImage('images/pre_login_bg.png'),
                  fit: BoxFit.cover
              ),
            ),*/
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [CommonColor.SEARCH_COLOR.withOpacity(0.95), CommonColor.GENERAL_POST_CONTAINER_COLOR.withOpacity(0.9)],
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
        ),
      ],
    );
  }

  /*get Reloading Page Layout*/
  Widget getReloadingPageLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: new EdgeInsets.only(top: parentHeight* 0.1),
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
      padding: new EdgeInsets.only(top: parentHeight* .05),
      child: Image(
        image: new AssetImage("assets/images/whatsapp.png"),
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
        padding: new EdgeInsets.only(top: SizeConfig.blockSizeVertical*15.0,left: SizeConfig.blockSizeHorizontal*8.5,right: SizeConfig.blockSizeHorizontal*8.5),
        child: Container(
          height: SizeConfig.blockSizeVertical*7.0,
          decoration: BoxDecoration(
              color: CommonColor.BLACK,
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

}
abstract class ErrorScreenInterface{

}


