import 'package:draivi/Screens/Login/LoginScreens.dart';
import 'package:draivi/Screens/Register/Registrasi.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreens.routeName: (context) => LoginScreens(),
  RegisterScreens.routeName: (context) => RegisterScreens()
};
