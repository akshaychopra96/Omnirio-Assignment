import 'package:flutter/material.dart';

class TextFieldHeaderText extends StatelessWidget {
  final String headerText;
  const TextFieldHeaderText({
    Key key,
    @required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Text(
        headerText + "*",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}
