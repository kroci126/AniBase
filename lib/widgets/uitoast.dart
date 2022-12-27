import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/*
** Ui Toast Widget
*/
class UiToast {
  BuildContext? context;

  UiToast(BuildContext ctx) {
    context = ctx;
  }

  static toastOk(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange[700],
        textColor: Colors.white,
        fontSize: 14);
  }

  static toastErr(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14);
  }

  static toastWarning(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.yellow,
        textColor: Colors.black,
        fontSize: 14);
  }
}
