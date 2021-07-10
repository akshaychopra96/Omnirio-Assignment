import 'package:assignment/login/login_screen.dart';
import 'package:assignment/utils/share_preference_helper.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);
  static const routeName = '/homepage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                child: Text("Homepage"),
              ),
              TextButton(
                child: Text(
                  'Sign Out',
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (Route<dynamic> route) => false);
                  SharePreferenceHelper().setLoggedInStatus(false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
