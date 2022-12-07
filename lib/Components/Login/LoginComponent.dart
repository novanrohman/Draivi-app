import 'package:draivi/Components/Login/LoginForm.dart';
import 'package:draivi/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../size_config.dart';

class LoginComponent extends StatefulWidget {
  @override
  _LoginComponent createState() => _LoginComponent();
}

class _LoginComponent extends State<LoginComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Login",
                  style: mTitleStyle24,
                )),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            // SizedBox(
            //   height: SizeConfig.screenHeight * 0.04,
            // ),
            SimpleShadow(
              child: Image.asset("assets/images/logo.png",
                  height: 120, width: 202),
              opacity: 0.5,
              color: kSecondaryColor,
              offset: Offset(5, 5),
              sigma: 2,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            SizedBox(
              height: 40,
            ),
            SignInform(),
          ]),
        ),
      ),
    ));
  }
}
