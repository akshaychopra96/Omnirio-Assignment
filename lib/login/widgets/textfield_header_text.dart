import 'package:flutter/material.dart';

class TextFieldHeaderText extends StatelessWidget {
  final String headerText;

  const TextFieldHeaderText({
    Key key,
    this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20),
      child: Text(
        headerText,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
