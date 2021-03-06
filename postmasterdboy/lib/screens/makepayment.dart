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

class Makepayment extends StatefulWidget {
  @override
  _MakepaymentState createState() => _MakepaymentState();
}

class _MakepaymentState extends State<Makepayment> {
  @override
  Widget rowWidget(String str1, String str2) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            str1,
            style: TextStyle(
              fontFamily: 'RobotoBold',
              fontSize: 22,
            ),
          ),
        ),
        //SizedBox(width: 40.0),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 50.0),
            child: Text(
              str2,
              style: TextStyle(
                fontFamily: 'RobotoBold',
                fontSize: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
        body: new Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Opacity(
                opacity: 0.9,
                child: Text(
                  "-Total COD Received-",
                  style: TextStyle(
                    fontFamily: 'RobotoBold',
                    decoration: TextDecoration.underline,
                    color: Colors.green,
                    fontSize: 30,
                    letterSpacing: 1.5,
                  ),
                ),
              )),
              SizedBox(height: 10.0),
              rowWidget("Rider pay to Postmaster", "400"),
              Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Divider(
                    color: Colors.black,
                  )),
              rowWidget("Postmaster pay to Rider", "500"),
              Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Divider(
                    color: Colors.black,
                  )),
              rowWidget("Postmaster Has pay to Rider", "-100"),
              Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Divider(
                    color: Colors.black,
                  )),
              SizedBox(height: 30.0),
              InkWell(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: Takeorder2()));
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
                        "Make Payment",
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
            ],
          ),
        ));
  }
}
