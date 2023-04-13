// ignore_for_file: constant_identifier_names

import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/app_text.dart';

class AppUtil {
  static GlobalKey<NavigatorState>? navigatorKey;

  static flushbarNotification(msg) {
    Alert(
      message: msg ?? '',
      shortDuration: false,
    ).show();
  }

  static Future appDialoge(
      {BuildContext? context, Widget? content, String? title}) async {
    return await showDialog(
        context: context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            title: AppText(title!),
            content: content,
          );
        });
  }
}

void defaultShowToast({
  required String message,
  required ToastStates states,
}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(states),
        textColor: Colors.white,
        fontSize: 16.0);
Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERORR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

enum ToastStates {
  SUCCESS,
  ERORR,
  WARNING,
}
