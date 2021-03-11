import 'package:flutter/material.dart';

import 'package:postmasterdboy/screens/login.dart';
import 'package:postmasterdboy/screens/orderstatus.dart';
import 'package:postmasterdboy/screens/signature.dart';

import 'Screens/Homepage.dart';

import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    //SharedPreferences.setMockInitialValues({});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');

    if (token != null) {
      setState(() {
        isLoggedIn = true;
        setDuty();
      });

      return;
    } else {
      setState(() {
        isLoggedIn = false;
      });

      return;
    }
  }

  void setDuty() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');

    /*http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/active_and_not_active.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": token,
      },
    );*/

    prefs.setBool("duty", false);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Postman",
                theme: ThemeData(
                  primaryColor: Color(0xFF27DEBF),
                  dividerColor: Colors.transparent,
                ),
                home: Orderstatus() //isLoggedIn ? Homepage() : Login(),
                );
          },
        );
      },
    );
  }
}
