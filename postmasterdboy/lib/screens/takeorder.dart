import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/screens/homepage.dart';
import 'package:postmasterdboy/screens/information.dart';
import 'package:postmasterdboy/screens/orderstatus.dart';
import 'package:postmasterdboy/screens/setprofile.dart';
import 'package:postmasterdboy/screens/chat.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class Takeorder extends StatefulWidget {
  Takeorder({
    Key key,
    this.customer_name,
    this.amount,
    this.description,
    this.pickupaddress,
    this.pickuptime,
    this.dropaddress,
    this.droptime,
    this.pickupdate,
    this.dropdate,
    this.commission,
    this.orderId,
    this.orderType,
  }) : super(key: key);

  final String customer_name;
  final String description;
  final String amount;
  final String pickupaddress;
  final String pickuptime;
  final String dropaddress;
  final String droptime;
  final String pickupdate;
  final String dropdate;
  final String commission;
  final String orderId;
  final String orderType;

  @override
  _TakeorderState createState() => _TakeorderState();
}

class _TakeorderState extends State<Takeorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.customer_name,
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
                  "Rs. " + widget.amount,
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
        body: new Container(
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
                  widget.description,
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
                        widget.pickupaddress,
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
                        widget.dropaddress,
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
              InkWell(
                onTap: () {
                  takeOrder();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 33.0, right: 33.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF2BCDB4),
                    //border: Border.all(color: Colors.blueAccent),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Text(
                        "Take Order",
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
        ));
  }

  Future<http.Response> takeOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map data = {
      "order_id": widget.orderId,
      "order_type": widget.orderType,
      "order_status": "active",
    };

    var body = json.encode(data);

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/order_progress.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
      body: body,
    );

    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      Navigator.push(context, SlideLeftRoute(page: Homepage()));
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
    return res;
  }
}
