import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/screens/customersign.dart';
import 'package:postmasterdboy/screens/information.dart';
import 'package:postmasterdboy/screens/setprofile.dart';
import 'package:postmasterdboy/screens/chat.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postmasterdboy/Components/animate.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Orderstatus extends StatefulWidget {
  @override
  _OrderstatusState createState() => _OrderstatusState();
}

class _OrderstatusState extends State<Orderstatus> {
  int _radioValue = 10;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Customer Name",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: displayWidth(context) * 0.05,
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () async {},
              child: Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.023,
                    right: displayWidth(context) * 0.06),
                child: Text(
                  "Rs. 750",
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'RobotoBold',
                    fontSize: displayWidth(context) * 0.05,
                  ),
                ),
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  margin: const EdgeInsets.only(top: 5, right: 10),
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontSize: displayWidth(context) * 0.05,
                    ),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 5, right: 10),
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Ornare leo non mollis id cursus. Eu euismod faucibus in leo ''',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: displayWidth(context) * 0.04,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                new Container(
                  margin: const EdgeInsets.only(top: 5, right: 10),
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "Pick-up Location",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontSize: displayWidth(context) * 0.05,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(top: 5, right: 10),
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Ornare leo non mollis id cursus. Eu euismod faucibus in leo ''',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: displayWidth(context) * 0.04,
                          ),
                        ),
                      ),
                    ),
                    new Container(
                        margin: const EdgeInsets.only(
                          top: 0,
                        ),
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 45,
                        )),
                  ],
                ),
                SizedBox(height: 20),
                new Container(
                  margin: const EdgeInsets.only(top: 5, right: 10),
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "Drop-off Location",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoBold',
                      fontSize: displayWidth(context) * 0.05,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: new Container(
                        margin: const EdgeInsets.only(top: 5, right: 10),
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Ornare leo non mollis id cursus. Eu euismod faucibus in leo ''',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: displayWidth(context) * 0.04,
                          ),
                        ),
                      ),
                    ),
                    new Container(
                        margin: const EdgeInsets.only(
                          top: 0,
                        ),
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 45,
                        )),
                  ],
                ),
                SizedBox(height: 30.0),
                Container(
                  margin: const EdgeInsets.only(left: 33.0, right: 33.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    //border: Border.all(color: Colors.blueAccent),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Text(
                        "Update Location",
                        style: TextStyle(
                            fontFamily: 'RobotoBold',
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Column(
                  children: [
                    Row(
                      children: [
                        new Radio(
                          value: 0,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _radioValue = 0;
                            });
                          },
                          child: new Text(
                            'Picked up',
                            style: new TextStyle(fontSize: 26.0),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        new Radio(
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _radioValue = 1;
                            });
                          },
                          child: new Text(
                            'On The Way',
                            style: new TextStyle(
                              fontSize: 26.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        new Radio(
                          value: 2,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _radioValue = 2;
                            });
                          },
                          child: new Text(
                            'Just about to reach',
                            style: new TextStyle(fontSize: 26.0),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                InkWell(
                  onTap: () {
                    //deliverNowotp();
                    Navigator.push(
                        context, SlideLeftRoute(page: Customersign()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 33.0, right: 33.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      //border: Border.all(color: Colors.blueAccent),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          "Deliver now",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Center(
                  child: new Container(
                    margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFF0F0F0),
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                          )
                        ]),
                    child: Container(
                      margin: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Total Price",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: displayWidth(context) * 0.04,
                                  ),
                                ),
                              ),
                              SizedBox(width: 30),
                              Expanded(
                                child: Text(
                                  "₹750",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoBold',
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Commission",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: displayWidth(context) * 0.04,
                                  ),
                                ),
                              ),
                              SizedBox(width: 30),
                              Expanded(
                                child: Text(
                                  "₹50",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'RobotoBold',
                                    fontSize: displayWidth(context) * 0.05,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<http.Response> deliverNowotp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map data = {
      "phn_number": "phn_number1",
    };
    var body = json.encode(data);

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/delivered_otp.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": token
      },
    );

    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      Navigator.push(context, SlideLeftRoute(page: Customersign()));
    }
    return res;
  }
}
