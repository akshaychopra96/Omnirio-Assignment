import 'package:assignment/homepage/homepage.dart';
import 'package:assignment/login/login_screen.dart';
import 'package:assignment/utils/share_preference_helper.dart';
import 'package:flutter/material.dart';

class HomepageWrapper extends StatefulWidget {
  const HomepageWrapper({Key key}) : super(key: key);

  @override
  _HomepageWrapperState createState() => _HomepageWrapperState();
}

class _HomepageWrapperState extends State<HomepageWrapper> {
  @override
  void initState() {
    super.initState();
    isRemebered();
  }

  bool isRemembered;
  void isRemebered() async {
    isRemembered = await SharePreferenceHelper().isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    if (isRemembered == null) {
      return Center(child: CircularProgressIndicator());
    } else if (isRemembered) {
      return Homepage();
    } else {
      return LoginScreen();
    }
  }
}
