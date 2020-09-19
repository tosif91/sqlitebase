import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqlitebase/services/authentication.dart';
import 'package:sqlitebase/view/splash/splash_model.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  @override
  void initState() {
    Timer(Duration(seconds: 1), (){SplashModel().checkState();});
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        
      ),
    );
  }
}