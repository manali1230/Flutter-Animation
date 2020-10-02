import 'package:Animate2/animate.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData.dark(),
    home: AnimatedSplash(
      imagePath: 'assets/animate.jpg',
      home: Animate(),
      duration: 2500,
      type: AnimatedSplashType.StaticDuration,
    ),
  ));
}
