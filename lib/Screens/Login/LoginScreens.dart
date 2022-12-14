import 'package:draivi/Components/Login/LoginComponent.dart';
import 'package:draivi/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreens extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //menghilangakn back button
      ),
      body: LoginComponent(),
    );
  }
}
