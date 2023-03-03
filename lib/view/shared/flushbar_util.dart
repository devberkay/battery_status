import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlashbarUtil {
  static showUtilFlashbar(
      {required BuildContext context,
      required String msg,
      required String actionMsg,
      Color? leftBarIndicatorColor}) {
    final usableHeight = MediaQuery.of(context).size.height;
    final usableWidth = MediaQuery.of(context).size.width;
    Flushbar(
      leftBarIndicatorColor: leftBarIndicatorColor,
      duration: const Duration(milliseconds: 3000),
      message: msg,
      messageSize: usableWidth * 0.04,
      maxWidth: usableWidth * 0.7,
      padding: EdgeInsets.symmetric(
          horizontal: usableWidth * .05, vertical: usableHeight * 0.01),
      margin: EdgeInsets.only(
          bottom: usableWidth * 0.15,
          left: usableWidth * 0.15,
          right: usableWidth * 0.15),
      borderRadius: BorderRadius.circular(usableHeight * 0.015),
      mainButton: TextButton(
          onPressed: () {
            context.pop();
          },
          style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              padding: EdgeInsets.zero,
              alignment: Alignment.center),
          child: Text(actionMsg,
              style: TextStyle(
                  fontSize: usableWidth * 0.035,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))),
    ).show(context);
  }
}
