import 'package:assignment/constants.dart';
import 'package:flutter/material.dart';

class PasswordContainer extends StatelessWidget {
  const PasswordContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: inputFileldContainerDecoration(),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        decoration: buildInputDecoration(hintText: "Enter Password"),
        validator: (input) =>
            input.isValidPassword() ? null : "Invalid Password",
      ),
    );
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{3,}$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(this);
  }
}
