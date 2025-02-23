import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28);
  }

  static TextStyle lightTextFieldStyle() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiboldTextFeildStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold);
  }
}
