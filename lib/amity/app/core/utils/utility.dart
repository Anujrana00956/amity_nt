
import 'dart:async';
import 'dart:io';
import 'package:amity_nt/amity/app/core/app_enums/app_enums.dart';
import 'package:amity_nt/amity/app/core/constant/app_color_constsnt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class Utility {
  
  static void showAlertDialogue(String? message, String? title,
      Function()? onPress, String? successText) async {
    await Get.dialog(CupertinoAlertDialog(
      title: Text('$title'),
      content: Text('$message'),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPress,
            child: Text(successText.toString())),
        const CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: closeDialog,
          child: Text('No'),
        )
      ],
    ));
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }
  //show Message
  static void showMessage(String? message, MessageType messageType,
      Function()? onTap, String actionName) {
    if (message == null || message.isEmpty) return;
    closeDialog();
    closeSnackBar();
    var backgroundColor = Colors.black;
    switch (messageType) {
      case MessageType.error:
        backgroundColor = errorTextColor;
        break;
      case MessageType.information:
        backgroundColor = Colors.black.withOpacity(0.3);
        break;
      case MessageType.success:
        backgroundColor = greenColor;
        break;
      default:
        backgroundColor = Colors.black;
        break;
    }
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Get.rawSnackbar(
            messageText: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
            mainButton: TextButton(
              onPressed: onTap ?? Get.back,
              child: Text(
                actionName,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: backgroundColor,
            margin: const EdgeInsets.all(15.0),
            borderRadius: 15,
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM
            //snackStyle: //SnackStyle.FLOATING,
            );
      },
    );
  }

  /// Close any open snack bar.
  static void closeSnackBar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }

  /// Show loader
  static showLoader() async {
    await Get.dialog(
      Center(
        child: Container(
            height: 55,
            width: 90,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20, // Adjust the height
                    width: 20, // Adjust the width
                    child: CircularProgressIndicator(color: Colors.red),
                  ),
                ])),
      ),
      barrierDismissible: false,
      // barrierColor: Colors.transparent,
    );
  }

  /// Close loader
  static void closeLoader() {
    closeDialog();
  }

  //show Toast Message
  static showToast(text) async {
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: Platform.isAndroid || Platform.isIOS ? 16.0 : 32);
  }

 

  //get time format
  static String getTimeFormat(int value) {
    int  h, m, s;

     h = value ~/ 3600;

    m = ((value - h  * 3600)) ~/ 60;

    s = value - ( h  * 3600) - (m * 60);

    String hourLeft =  h.toString().length < 2 ? "0  " : h .toString();

    String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

    String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";

    return result;
  }

  
}

