import 'dart:html';

// import 'package:draivi/Components/Home/HomeComponent.dart';
import 'package:draivi/Components/Home/HomeComponent.dart';
import 'package:draivi/size_config.dart';
import 'package:draivi/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  static String routeName = "/Home";
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);

    // return Scaffold(
    //   appBar: AppBar(automaticallyImplyLeading: false,),
    // body: HomeComponent(),
    // );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(
          'Draivi',
          style: mTitleStyleColorWhite20,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Available Cars',
              style: mMainHeading,
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: HomeComponent()),
        ],
      ),
    );
  }
}
