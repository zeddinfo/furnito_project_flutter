import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furnito_chart/Models/user_session.dart';
import 'package:furnito_chart/helpers/session.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic temp;

  void loadConfig() async {
    try {
      var data = await Session.readDataByKey('userSession');
      setState(() {
        temp = data;
      });
    } catch (error) {
      print('error loadConfig');
    }
  }

  @override
  void initState() {
    loadConfig();
    Timer(
      Duration(seconds: 3),
      () => temp != null
          ? Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false)
          : Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (r) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/ic-app.png'))),
        ),
      ),
    );
  }
}
