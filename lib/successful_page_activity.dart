import 'package:flutter/material.dart';
import 'package:sampleproject/size_config.dart';

class SuccessfulPageActivity extends StatefulWidget {
  const SuccessfulPageActivity({Key? key}) : super(key: key);

  @override
  State<SuccessfulPageActivity> createState() => _SuccessfulPageActivityState();
}

class _SuccessfulPageActivityState extends State<SuccessfulPageActivity> {


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
              width: SizeConfig.screenWidth,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: SizeConfig.screenHeight*.1),
                    child: Image(
                      image: AssetImage("images/successful_image.png"),
                      fit: BoxFit.contain,
                      height: SizeConfig.screenHeight*.5,
                      width: SizeConfig.screenWidth,
                    ),
                  ),
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

}
