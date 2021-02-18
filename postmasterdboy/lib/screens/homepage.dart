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
import 'package:postmasterdboy/screens/home.dart';
import 'package:postmasterdboy/screens/profile.dart';
import 'package:postmasterdboy/screens/chat.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:postmasterdboy/Components/animate.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentstate = 0;
  final List<Widget> _children = [
    Available(),
    Chat(),
    Profile(),
    Information(),
  ];
  // void onTappedBar(int index) {
  //   setState(() {
  //     _currentstate = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, SlideLeftRoute(page: Available()));
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: displayHeight(context) * 0.023,
                  right: displayWidth(context) * 0.06),
              child: Text(
                "Invite",
                style: TextStyle(
                  color: Color(0xFF27DEBF),
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
            child: SvgPicture.asset(
              language,
              color: Color(0xFF465A64),
            ),
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
            color: Colors.green[400], //Color(0XFF2BCDB4),
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