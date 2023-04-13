import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// ignore: non_constant_identifier_names

extension NavigationScreens on Widget {
  // ignore: non_constant_identifier_names
  Push(
      {required BuildContext context,
      required PageTransitionType type,
      // @required Widget Destination,
      int? duration,
      // ignore: non_constant_identifier_names
      Widget? Current}) {
    Navigator.push(
        context,
        PageTransition(
            type: type,
            duration: Duration(milliseconds: duration ?? 500),
            child: this,
            childCurrent: Current ?? context.widget,
            alignment: Alignment.center));
  }

  // ignore: non_constant_identifier_names
  PushAndReplace(
      {required BuildContext context,
      required PageTransitionType type,
      // @required Widget Destination,
      int? duration,
      // ignore: non_constant_identifier_names
      Widget? Current}) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            type: type,
            alignment: Alignment.center,
            duration: Duration(milliseconds: duration ?? 500),
            child: this,
            childCurrent: Current ?? context.widget),
        (route) => false);
  }
}
