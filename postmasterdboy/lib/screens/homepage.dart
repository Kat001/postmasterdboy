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

import 'package:postmasterdboy/screens/profile.dart';
import 'package:postmasterdboy/screens/setprofile.dart';
import 'package:postmasterdboy/screens/profile.dart';
import 'package:postmasterdboy/screens/chat.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentstate = 0;
  bool _setDuty = true;
  final List<Widget> _children = [
    Available(),
    Profile(),
    Chat(),
    Information(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _setDuty = prefs.getBool("duty");
    });
  }

  Future<void> setDuty(int number) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');

    Map data = {
      "is_active": number,
    };

    var body = json.encode(data);

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/active_and_not_active.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": token,
      },
      body: body,
    );
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
      showDialog(
        context: context,
        builder: (context) =>
            CustomDialog("Success", responseData['message'], "Okay", 3),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          InkWell(
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              if (_setDuty == true) {
                prefs.setBool("duty", false);
                setDuty(0);
              } else {
                prefs.setBool("duty", true);
                setDuty(1);
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: displayHeight(context) * 0.023,
                  right: displayWidth(context) * 0.06),
              child: _setDuty
                  ? Text(
                      "On-Duty",
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'RobotoBold',
                        fontSize: displayWidth(context) * 0.05,
                      ),
                    )
                  : Text(
                      "Off-Duty",
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'RobotoBold',
                        fontSize: displayWidth(context) * 0.05,
                      ),
                    ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: displayWidth(context) * 0.05),
            width: 25,
            height: 25,
            child: _setDuty
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.check_circle,
                    color: Colors.red,
                  ), /*SvgPicture.asset(
              language,
              color: Color(0xFF465A64),
            ),*/
          )
        ],
        leading: IconButton(
          onPressed: () async {
            // exit(0);
            return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Are you sure?',
                        style: TextStyle(
                            fontFamily: "Roboto", color: Color(0xFF465A64))),
                    content: Text('Do you want to exit an App',
                        style: TextStyle(
                            fontFamily: "Roboto", color: Color(0xFF465A64))),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () => exit(0),
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
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      bottomNavigationBar: Container(
        height: _screenSize.height * 0.10,
        child: SizedBox(
          height: displayHeight(context) * 0.05,
          child: BottomAppBar(
            color: Color(0xFF2BCDB4), //Color(0XFF2BCDB4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                //New Orders
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentstate = 0;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: displayHeight(context) * 0.02,
                      //left: displayWidth(context) * 0.05,
                      //right: displayWidth(context) * 0.05,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: displayWidth(context) * 0.08,
                            height: displayHeight(context) * 0.03,
                            margin: EdgeInsets.only(
                              bottom: displayHeight(context) * 0.005,
                            ),
                            child: SvgPicture.asset(
                              info,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: displayHeight(context) * 0.005,
                            ),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: displayHeight(context) * 0.015,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentstate = 1;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: displaySize(context).height * 0.02,
                      //left: displayWidth(context) * 0.05,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: displayWidth(context) * 0.08,
                            height: displayHeight(context) * 0.03,
                            margin: EdgeInsets.only(
                              bottom: displayHeight(context) * 0.005,
                            ),
                            child: SvgPicture.asset(
                              add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: displayHeight(context) * 0.005,
                            ),
                            child: Text("Profile",
                                style: TextStyle(
                                  fontSize: displayHeight(context) * 0.015,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //till here done with mediaquery
                //Info

                //Chat
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentstate = 2;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: displayHeight(context) * 0.02,
                      // left: displayWidth(context) * 0.05,
                      // right: displayWidth(context) * 0.05,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: displayWidth(context) * 0.08,
                            height: displayHeight(context) * 0.03,
                            margin: EdgeInsets.only(
                              bottom: displayHeight(context) * 0.005,
                            ),
                            child: SvgPicture.asset(
                              chaticon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: displayHeight(context) * 0.005,
                            ),
                            child: Text("Chat",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: displayHeight(context) * 0.015,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //Profile
                InkWell(
                  onTap: () {
                    setState(() {
                      _currentstate = 3;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: displayHeight(context) * 0.02,
                      //left: displayWidth(context) * 0.05,
                      //right: displayWidth(context) * 0.05,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: displayWidth(context) * 0.08,
                            height: displayHeight(context) * 0.03,
                            margin: EdgeInsets.only(
                              bottom: displayHeight(context) * 0.005,
                            ),
                            child: SvgPicture.asset(
                              profile_icon,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                top: displayHeight(context) * 0.005,
                              ),
                              child: Text(
                                'info',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: displayHeight(context) * 0.015,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _children[_currentstate],
    );
  }
}
