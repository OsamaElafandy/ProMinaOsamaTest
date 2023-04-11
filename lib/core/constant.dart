import 'package:flutter/material.dart';

class AppConst {
  static inputDecoration({String? labelText}) {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(22),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
          borderSide: BorderSide(
            color: Colors.white,
            width: 0,
          )),
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
          borderSide: BorderSide(
            color: Colors.white,
            width: 0,
          )),
      labelStyle: const TextStyle(
        color: Colors.grey,
      ),
      labelText: labelText,
    );
  }
}

setHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

setWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

setFontSize(BuildContext context) {
  return MediaQuery.of(context).size.width / 3;
}

isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width > 600;
}
