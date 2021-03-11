////No need of tghis file...............

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:postmasterdboy/Components/sizes_helpers.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:postmasterdboy/screens/example.dart';
import 'package:postmasterdboy/screens/orderstatus.dart';
import 'package:postmasterdboy/screens/takeorder.dart';

import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/Components/animate.dart';

import 'package:postmasterdboy/Components/animate.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:convert';

class Activeorders extends StatefulWidget {
  @override
  _ActiveordersState createState() => _ActiveordersState();
}

class _ActiveordersState extends State<Activeorders> {
  final _formKey = GlobalKey<FormState>();
  bool _isData = false;

  List<dynamic> orderPackage = [];
  List<dynamic> orderShop = [];
  List<dynamic> orderRestaurant = [];

  @override
  void initState() {
    super.initState();
    activeOrders();
  }

  Future<void> activeOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/active_order.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
    );
    //print(res.body);
    var responseData = json.decode(res.body);

    if (responseData["status"] == 200) {
      //print(responseData["order_package"]);
      setState(() {
        orderPackage = responseData["order_package"];
        orderShop = responseData["order_shop"];
        orderRestaurant = responseData["order_restaurant"];
      });
      setState(() {
        _isData = true;
      });
    } else {}
  }

  Widget orderWidget(String orderid, String orderTotal, String pickUpAddress,
      String dropAddress) {
    return new Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200], //Color(0xFFE4EDEF),
          boxShadow: [
            /* BoxShadow(
              color: Color(0xFFF0F0F0),
              blurRadius: 5.0,
              spreadRadius: 5.0,
            )*/
          ]),
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: Text(
                "Order-id:#" + orderid,
                style: TextStyle(
                  fontFamily: "RobotoBold",
                  fontSize: displayWidth(context) * 0.06,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    orderTotal,
                    style: TextStyle(
                      fontFamily: 'RobotoBold',
                      color: Color(0xFF27DEBF),
                      fontSize: displayWidth(context) * 0.04,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    pickUpAddress,
                    style: TextStyle(
                      fontFamily: 'RobotoBold',
                      color: Color(0xFF27DEBF),
                      fontSize: displayWidth(context) * 0.04,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orderstatus()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
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
                      "Change Status",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isData
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                            itemCount: orderPackage.length,
                            shrinkWrap:
                                true, // todo comment this out and check the result
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return orderWidget(orderPackage[index]["id"],
                                  "orderTotal", "pickUpAddress", "dropAddress");
                            }),
                        ListView.builder(
                            itemCount: orderShop.length,
                            shrinkWrap:
                                true, // todo comment this out and check the result
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return orderWidget(
                                  orderShop[index]["shop_order_id"],
                                  "orderTotal",
                                  "pickUpAddress",
                                  "dropAddress");
                            }),
                        ListView.builder(
                            itemCount: orderRestaurant.length,
                            shrinkWrap:
                                true, // todo comment this out and check the result
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return orderWidget(
                                  "orderShop[index][shop_order_id]",
                                  "orderTotal",
                                  "pickUpAddress",
                                  "dropAddress");
                            }),
                      ],
                    ),
                  );
                },
                itemCount: 1,
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
