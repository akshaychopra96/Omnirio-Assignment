import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);

BoxDecoration inputFileldContainerDecoration() {
  return BoxDecoration(
    border: Border.all(
      style: BorderStyle.solid,
      color: Colors.grey[400],
    ),
    borderRadius: BorderRadius.circular(10),
  );
}

InputDecoration buildInputDecoration({String hintText}) {
  return InputDecoration(
      // border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 12,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0));
}
