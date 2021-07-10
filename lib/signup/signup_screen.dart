import 'package:assignment/signup/components/signup_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);
  static const routeName = '/signupScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpForm(),
    );
  }
}
