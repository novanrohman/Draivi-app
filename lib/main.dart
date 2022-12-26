import 'package:draivi/Screens/Home/HomeScreens.dart';
import 'package:draivi/Screens/Login/LoginScreens.dart';
import 'package:draivi/routes.dart';
import 'package:draivi/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      title: "Draivi",
      theme: theme(),
      initialRoute: LoginScreens.routeName,
      routes: routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
