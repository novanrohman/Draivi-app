import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:draivi/Components/custom_surfix_icon.dart';
import 'package:draivi/Components/default_button_custome_color.dart';
import 'package:draivi/Screens/Home/HomeScreens.dart';
import 'package:draivi/Screens/Register/Registrasi.dart';
import 'package:draivi/size_config.dart';
import 'package:draivi/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart';

class SignInform extends StatefulWidget {
  @override
  _SignInForm createState() => _SignInForm();
}

class _SignInForm extends State<SignInform> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visible = false;
  final String sUrl = "https://127.0.0.1:8000/api/";

  @override
  void initState() {
    super.initState();
  }

  _cekLogin(String email, password) async {
    setState(() {
      visible = true;
    });
    final prefs = await SharedPreferences.getInstance();

    try {
      Response response = await post(
          Uri.parse('http://127.0.0.1:8000/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("data sukses");
        Navigator.of(context)
            .push(MaterialPageRoute(
          builder: (context) => HomeScreens(),
        ))
            .then((value) {
          setState() {}
        });
      } else if (response.statusCode == 401) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Oops...',
          text: 'Maaf, Email atau Password yang anda masukkan salah',
        );
      } else {
        print("data Errror");
      }
    } catch (e) {
      print("errror");
    }
  }

  // _showAlertDialog(BuildContext context, String err) {
  //   Widget okButton = FloatingActionButton(
  //     child: Text("OK"),
  //     onPressed: () => Navigator.pop(context),
  //   );
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Error"),
  //     content: Text(err),
  //     actions: [
  //       okButton,
  //     ],
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              _cekLogin(emailController.text.toString(),
                  passwordController.text.toString());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text('Login'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreens.routeName);
            },
            child: Text(
              "Belum punya akun? Daftar disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          hintText: 'Masukkan email anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          hintText: 'Masukkan password anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )),
    );
  }
}
