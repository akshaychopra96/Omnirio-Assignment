import 'package:assignment/constants.dart';
import 'package:flutter/material.dart';

class FullnameContainer extends StatelessWidget {
  const FullnameContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: inputFileldContainerDecoration(),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.name,
        decoration: buildInputDecoration(hintText: "Enter Full Name"),
        validator: (input) => input.isEmpty ? "Invalid Full Name" : null,
      ),
    );
  }
}
