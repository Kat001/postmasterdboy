import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:postmasterdboy/screens/bankdetails.dart';
import 'package:postmasterdboy/screens/estimate.dart';
import 'package:postmasterdboy/screens/leaveapplication.dart';
import 'package:postmasterdboy/screens/login.dart';
import 'package:postmasterdboy/screens/makepayment.dart';
import 'package:postmasterdboy/screens/refer.dart';
import 'package:postmasterdboy/screens/setprofile.dart';

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
          //border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white, //Color(0xFFE4EDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.0),
            new Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white, //Color(0xFFE4EDEF),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(page: Setprofile()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset(
                        profile_icon,
                        color: Color(0xFF465A64),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Personal Details",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.0),
            new Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white, //Color(0xFFE4EDEF),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(page: Bankdetail()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 25,
                        height: 25,
                        child: Icon(Icons.monetization_on)),
                    Container(
                      child: Text(
                        "Bank Details",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.0),
            new Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white, //Color(0xFFE4EDEF),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(page: Leaveapplication()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 25,
                      height: 25,
                      child: Icon(Icons
                          .format_align_left_rounded), /*SvgPicture.asset(
                        profile_icon,
                        color: Color(0xFF465A64),
                      ),*/
                    ),
                    Container(
                      child: Text(
                        "Leave Application",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.0),
            new Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white, //Color(0xFFE4EDEF),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(page: Refer()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset(
                        refer,
                        color: Color(0xFF465A64),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Refer and Earn",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.0),
            new Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white, //Color(0xFFE4EDEF),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(page: Makepayment()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 25,
                      height: 25,
                      child: SvgPicture.asset(
                        money,
                        color: Color(0xFF465A64),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Make Payment",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.0),
            new Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white, //Color(0xFFE4EDEF),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(page: Estimate()),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 25,
                      height: 25,
                      child: Icon(Icons
                          .format_align_left_rounded), /*SvgPicture.asset(
                        profile_icon,
                        color: Color(0xFF465A64),
                      ),*/
                    ),
                    Container(
                      child: Text(
                        "Total Estimate",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.0),
            InkWell(
              onTap: () async {
                return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Are you sure?',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                color: Color(0xFF465A64))),
                        content: Text('Do you want to Logout from an App',
                            style: TextStyle(
                                fontFamily: "Roboto",
                                color: Color(0xFF465A64))),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString("token", null);
                              Navigator.push(
                                  context, SlideLeftRoute(page: Login()));
                            },
                            child: Text('Yes',
                                style: TextStyle(
                                    fontFamily: "RobotoBold",
                                    color: Color(0xFF2BCDB4))),
                          ),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            /*Navigator.of(context).pop(true)*/
                            child: Text('No',
                                style: TextStyle(
                                    fontFamily: "RobotoBold",
                                    color: Color(0xFF2BCDB4))),
                          ),
                        ],
                      ),
                    ) ??
                    false;
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  //border: Border.all(color: Colors.blueAccent),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: Divider(
                  color: Colors.black,
                )),
            SizedBox(height: 10.0),
            Center(child: Text("App Version 1.00.1.0")),
          ],
        ),
      ),
    );
  }
}
