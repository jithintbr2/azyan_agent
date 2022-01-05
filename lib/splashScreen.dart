import 'dart:async';
import 'package:flutter/material.dart';
import 'package:azyan_agent/common.dart';
import 'package:azyan_agent/dashboard.dart';
import 'package:azyan_agent/login.dart';
import 'package:azyan_agent/new_login.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash2 extends StatefulWidget {
  @override
  _newSplashState createState() => _newSplashState();
}

class _newSplashState extends State<Splash2> {
  final splashDelay = 2;
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    // return '';
    // return Timer(_duration, navigationPage);
    return Timer(_duration, routeTOHomePage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',width: 200,),
        ));
  }

  routeTOHomePage() async {
    // Navigator.pushReplacementNamed(context, RouteDashBoard);
    String tocken = await Common.getSharedPref("tocken");

    if (tocken != null)
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  Dashboard(tocken)),
              (Route<dynamic> route) => false);

    else
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) =>
                  NewLogin()),
              (Route<dynamic> route) => false);

  }




}

