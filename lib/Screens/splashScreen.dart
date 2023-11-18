import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../provider/weatherProvider.dart';
import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    return Timer(Duration(seconds: 6), changeScreen);
  }

  bool _isLoading = false;
  changeScreen() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return HomeScreen(
        isLoading: _isLoading,
      );
    }));
  }

  Future<void> _getData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);

    weatherData.getWeatherData(context);
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    _getData();
    SystemChrome.setEnabledSystemUIOverlays([]);
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Center(
          child: SpinKitWave(
            color: Colors.green,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
