import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/Components/animate.dart';

import 'package:postmasterdboy/Components/animate.dart';

import 'dart:async';
import 'dart:convert';

class Available extends StatefulWidget {
  @override
  _AvailableState createState() => _AvailableState();
}

class _AvailableState extends State<Available> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: TabBar(
              onTap: (index) {},
              indicatorColor: Colors.green[400],
              indicator: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(15),
              ),
              tabs: [
                Tab(
                  child: Text(
                    "AVAILABLE ",
                    style: TextStyle(
                        color: Color(0xFF465A64),
                        fontFamily: "RobotoBold",
                        fontSize: displayWidth(context) * 0.04),
                  ),
                ),
                Tab(
                  child: Text(
                    "ACTIVE",
                    style: TextStyle(
                        color: Color(0xFF465A64),
                        fontFamily: "RobotoBold",
                        fontSize: displayWidth(context) * 0.04),
                  ),
                ),
                Tab(
                  child: Text(
                    "COMPLETED",
                    style: TextStyle(
                        color: Color(0xFF465A64),
                        fontFamily: "RobotoBold",
                        fontSize: displayWidth(context) * 0.04),
                  ),
                ),
              ],
            ),
            body: TabBarView(children: [
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Buy from store

                      //Favrouite store

                      //Subscription

                      //Buy from store
                      InkWell(
                        onTap: () {
                          /*Navigator.push(
                              context, SlideLeftRoute(page: FavoriteStore()));*/
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 5.0.h,
                              left: 8.0.w,
                              right: 8.0.w,
                              bottom: 4.0.h),
                          width: 120.0.w,
                          height: 12.0.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFF0F0F0),
                                  blurRadius: 5.0,
                                  spreadRadius: 5.0,
                                ),
                              ]),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: displayWidth(context) * 0.05),
                                  width: displayWidth(context) * 0.1,
                                  height: displayHeight(context) * 0.05,
                                  child: SvgPicture.asset(
                                    cart,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: displayWidth(context) * 0.05,
                                      top: displayHeight(context) * 0.015),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom:
                                                displayHeight(context) * 0.01),
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontFamily: "RobotoBold",
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        child: Text(
                                          "Available",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize:
                                                displayWidth(context) * 0.04,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              Container(
                  child: Center(
                child: Text("hjk"),
              ) //ActiveOrders(),
                  ),
              Center(
                child: Container(
                  child: Text("Completed Orders"),
                ),
              ),
            ])),
      ),
    );
  }
}
