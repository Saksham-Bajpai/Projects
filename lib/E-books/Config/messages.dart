
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void successMessage(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: const Color(0xff00C236),
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

void errorMessage(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: const Color(0xffF24E1E),
    textColor: Colors.white,
    fontSize: 15.0,
  );
}
