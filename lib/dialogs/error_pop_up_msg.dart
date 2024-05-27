import 'package:flutter/material.dart';
import 'package:sampleproject/core/colors.dart';
import 'package:sampleproject/size_config.dart';



class ErrorMsgPopDialogDialog extends StatefulWidget {
  final String message;
  final String title;
  const ErrorMsgPopDialogDialog({ required this.message,  this.title=""}) : super();



  @override
  _ErrorMsgPopDialogDialog createState() => _ErrorMsgPopDialogDialog();
}

class _ErrorMsgPopDialogDialog extends State<ErrorMsgPopDialogDialog> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child:  Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenWidth * .08,
                right: SizeConfig.screenWidth * .15,
                left: SizeConfig.screenWidth * .15,
                bottom: SizeConfig.screenWidth * .08),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),

              ),
              child: new Container(

                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(Radius.circular(20.0),
                  ),
                  border: Border.all(
                      color: CommonColor.DIVIDER_COLOR
                  ),
                  color: CommonColor.WHITE_COLOR,
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getAddDeleteMessageLayout(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    getAddDeleteGameTextLayout(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),

                    getAddCancelButtonLayout(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /* Main Delete Message Layout */
  Widget getAddDeleteMessageLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * .021),
      child: Text(
        widget.title,
        // StringEn.FAILED_LOGIN,
        style: TextStyle(

          color: CommonColor.BLACK,
          fontSize: SizeConfig.blockSizeHorizontal * 4.5,
          fontWeight: FontWeight.w700,
          fontFamily: 'Roboto_Bold',
        ),
      ),
    );
  }

  /* Get Add Delete Game Text Layout */
  Widget getAddDeleteGameTextLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * .013,
          left: parentWidth * .04,
          right: parentWidth * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child:
            Text(
              //StringEn.LOGIN_SUBTEXT,
              widget.message,
              style: TextStyle(
                color: CommonColor.BLACK,
                fontSize: SizeConfig.blockSizeHorizontal * 4.2,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto_Regular',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }



  /* Get Add Cancel Button Layout */
  Widget getAddCancelButtonLayout(double parentHeight, double parentWidth) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      onDoubleTap: (){},
      child: Padding(
        padding: EdgeInsets.only(top: parentHeight * .01),
        child: Container(
          height: parentHeight * .06,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: CommonColor.DIVIDER_COLOR),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "OK",
                /* StringEn.OK_GAME_DIALOG,*/
                style: TextStyle(
                  color: CommonColor.THEME_COLOR,
                  fontSize: SizeConfig.blockSizeHorizontal * 4.2,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto_Medium',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}