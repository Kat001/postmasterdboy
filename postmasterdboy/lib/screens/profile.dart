import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:sizer/sizer.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:postmasterdboy/Components/animate.dart';

//import 'package:http/http.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:convert';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String firstName = "";
  String middleName = "";
  String lastName = "";
  String email = "";
  String phon = "";

  double amount = 0;

  @override
  void initState() {
    super.initState();
    //fetchInformation();
    //fetchamount();
  }

  /*Future fetchInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      firstName = prefs.getString("first_name");
      lastName = prefs.getString("last_name");
      email = prefs.getString("email");
      phon = prefs.getString("phn_number");
    });
  }*/

  /*Future<http.Response> fetchamount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    http.Response res;

    res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/fetch_wallet_balance.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": token,
      },
    );
    print(res.body);
    var responseData = json.decode(res.body);

    if (responseData['status'] == 200) {
      var balance = responseData['wallet_balance'];
      double data = double.parse(balance);
      setState(() {
        amount = data;
      });
    }

    return res;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white, //Color(0xFFE4EDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white, //Color(0xFFE4EDEF),
              ),
              child: Row(
                children: [
                  Text("devpal"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
