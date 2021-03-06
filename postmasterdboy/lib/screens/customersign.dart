import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/screens/information.dart';
import 'package:postmasterdboy/screens/takeorder2.dart';

import 'package:postmasterdboy/screens/setprofile.dart';
import 'package:postmasterdboy/screens/chat.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class Customersign extends StatefulWidget {
  @override
  _CustomersignState createState() => _CustomersignState();
}

class _CustomersignState extends State<Customersign> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  final TextEditingController _fifthController = TextEditingController();
  final TextEditingController _sixthController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
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
                  Center(
                    child: new Container(
                      margin: const EdgeInsets.only(top: 5, right: 10),
                      padding: const EdgeInsets.all(3.0),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          '''We have sent an OTP to ''',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: displayWidth(context) * 0.07,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: new Container(
                      margin: const EdgeInsets.only(top: 5, right: 10),
                      padding: const EdgeInsets.all(3.0),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          '''Customer's Mobile''',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: displayWidth(context) * 0.07,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: TextFormField(
                              controller: _firstController,
                              maxLength: 1,
                              autofocus: true,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(),
                                counterText: "",
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                nextField(value, pin2FocusNode);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: TextFormField(
                              focusNode: pin2FocusNode,
                              controller: _secondController,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              maxLength: 1,
                              autofocus: true,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(),
                                counterText: "",
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                nextField(value, pin3FocusNode);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: TextFormField(
                              focusNode: pin3FocusNode,
                              controller: _thirdController,
                              maxLength: 1,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              autofocus: true,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                nextField(value, pin4FocusNode);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: TextFormField(
                              focusNode: pin4FocusNode,
                              controller: _fourthController,
                              maxLength: 1,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              autofocus: true,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                nextField(value, pin5FocusNode);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: TextFormField(
                              focusNode: pin5FocusNode,
                              controller: _fifthController,
                              maxLength: 1,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              autofocus: true,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                nextField(value, pin6FocusNode);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: TextFormField(
                              focusNode: pin6FocusNode,
                              controller: _sixthController,
                              maxLength: 1,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              autofocus: true,
                              obscureText: true,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                pin6FocusNode.unfocus();
                              },
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 10.0),
                  Center(
                      child: Text(
                    "Resend",
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'RobotoBold',
                      fontSize: displayWidth(context) * 0.05,
                    ),
                  )),
                  Center(
                    child: new Container(
                      margin: const EdgeInsets.only(top: 5, right: 10),
                      padding: const EdgeInsets.all(3.0),
                      child: Opacity(
                        opacity: 0.7,
                        child: Text(
                          '''Customer Signature''',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: displayWidth(context) * 0.07,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 300.0,
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200], //Color(0xFFE4EDEF),
                    ),
                    child: Container(),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      //Navigator.push(context, SlideLeftRoute(page: Takeorder2()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                            "Done",
                            style: TextStyle(
                                fontFamily: 'RobotoBold',
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          )),
    );
  }
}
