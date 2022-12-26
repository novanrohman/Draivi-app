import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@override
Widget build(BuildContext context) {
  return AnimatedSplashScreen(
    splash: 'images/logo.png',
    nextScreen: MainScreen(),
    splashTransition: SplashTransition.rotationTransition,
    pageTransitionType: PageTransitionType.scale,
  );
}
