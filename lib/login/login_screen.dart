import 'package:assignment/login/components/login_form.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);
  static const routeName = '/loginScreen';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: LoginForm(),
      ),
    );
  }
}
