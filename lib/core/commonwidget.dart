import 'package:flutter/material.dart';
import 'package:sampleproject/core/AppPreference.dart';
import 'package:sampleproject/dialogs/error_pop_up_msg.dart';
import 'package:sampleproject/dialogs/error_screen.dart';
import 'package:sampleproject/dialogs/no_interner_dialog.dart';

class CommonWidget {

  static noInternetDialogNew(BuildContext context) {
    if (context != null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              NoInternetConformationDialog( isFor: '',));
    }
  }

  static gotoErrorScreen(BuildContext context) async {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ErrorScreen()));
  }


  static onbordingErrorDialog(BuildContext context, String title,String message) {
    if (context != null) {
      showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
            // return Transform(
            //   transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: ErrorMsgPopDialogDialog(
                  message: message,
                  title: title,
                ),
              ),
            );
          },
          transitionDuration: Duration.zero,
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation2, animation1) {
            return Container();
          });
    }
  }


  static Widget getShowError(var topMargin,var rightMargin,var fontSize,bool isVis,String errorMsg){
    return Positioned(
      right: rightMargin,
      top: topMargin,
      child: isVis
          ? Container(
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.2),width:1),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            errorMsg,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontFamily: 'Avenir_Heavy',
              fontSize: fontSize,
            ),
            textScaleFactor: 1.02,
          ),
        ),
      )
          : Container(),
    );
  }


}