import 'package:draivi/Components/Register/RegisterComponent.dart';
import 'package:draivi/size_config.dart';
import 'package:flutter/material.dart';

class RegisterScreens extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //menghilangakn back button
      ),
      body: RegisterComponent(),
    );
  }
}
