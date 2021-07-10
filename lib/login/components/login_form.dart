import 'dart:ui';

import 'package:assignment/homepage/homepage.dart';
import 'package:assignment/login/widgets/textfield_header_text.dart';
import 'package:assignment/signup/signup_screen.dart';
import 'package:assignment/size_config.dart';
import 'package:assignment/utils/share_preference_helper.dart';
import 'package:assignment/widgets/email_container.dart';
import 'package:assignment/widgets/password_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: ListView(
          children: [
            //Title
            Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),

            TextFieldHeaderText(
              headerText: "Username or Email",
            ),

            //Username or Email Input Field
            EmailContainer(),

            TextFieldHeaderText(
              headerText: "Password",
            ),

            // Password Input Field
            PasswordContainer(),

            //Remember me Checkbox
            CheckboxListTile(
              title: Text(
                "Remember Me",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                ),
              ),
              value: isRememberMe,
              onChanged: (newValue) async {
                setState(() {
                  isRememberMe = newValue;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),

            //Login and Forgot password button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () => {
                        if (_formKey.currentState.validate())
                          {
                            if (isRememberMe)
                              {
                                SharePreferenceHelper()
                                    .setLoggedInStatus(isRememberMe),
                              },
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                Homepage.routeName,
                                (Route<dynamic> route) => false)
                          }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => {print("Clicked on Forgot Password")},
                    child: Text("Forgot Password ?"),
                  ),
                ],
              ),
            ),

            //Sign Up
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Sign up',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigate to desired screen
                            Navigator.pushNamed(
                              context,
                              SignUpScreen.routeName,
                              // (Route<dynamic> route) => false
                            );
                          }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
