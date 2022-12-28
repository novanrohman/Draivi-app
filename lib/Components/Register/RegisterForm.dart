import 'package:draivi/Components/custom_surfix_icon.dart';
import 'package:draivi/Components/default_button_custome_color.dart';
import 'package:draivi/Screens/Login/LoginScreens.dart';
import 'package:draivi/size_config.dart';
import 'package:draivi/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignUpform extends StatefulWidget {
  @override
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpform> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? username;
  String? email;
  int type = 0;
  String? password;
  String? repassword;

  final TextEditingController txtName = new TextEditingController();
  final TextEditingController txtUseUsername = new TextEditingController();
  final TextEditingController txtUseEmail = new TextEditingController();
  final TextEditingController txtType = new TextEditingController();
  final TextEditingController txtPassword = new TextEditingController();
  final TextEditingController txtrePassword = new TextEditingController();

  FocusNode focusNode = new FocusNode();

  Future _signup() async {
    if (txtUseUsername.text.isEmpty ||
        txtUseUsername.text.isEmpty ||
        txtUseEmail.text.isEmpty ||
        txtPassword.text.isEmpty) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Sorry, something went wrong',
      );
      return;
    }
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(message: "loading..");
    progressDialog.show();
    final response =
        await http.post(Uri.parse('http://127.0.0.1:8000/api/register'), body: {
      'name': txtUseUsername.text,
      'username': txtUseUsername.text,
      'email': txtUseEmail.text,
      'password': txtPassword.text,
      'password_confirmation': txtPassword.text
    }, headers: {
      'Accept': 'application/json'
    });
    progressDialog.hide();

    if (response.statusCode == 422) {
      Get.to(() => LoginScreens());
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Sorry, something went wrong',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUsername(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildrePassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "Buat Akun",
            press: () {
              this._signup();
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LoginScreens.routeName);
            },
            child: Text(
              "Sudah punya akun? Login disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildName() {
    return TextFormField(
      controller: txtName,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          hintText: 'Masukkan Nama anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildUsername() {
    return TextFormField(
      controller: txtUseUsername,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          hintText: 'Masukkan Username anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtUseEmail,
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
      controller: txtPassword,
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

  TextFormField buildrePassword() {
    return TextFormField(
      controller: txtrePassword,
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
