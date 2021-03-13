import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:postmasterdboy/Components/sizes_helpers.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:postmasterdboy/screens/active_orders.dart';
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

class Available extends StatefulWidget {
  @override
  _AvailableState createState() => _AvailableState();
}

class _AvailableState extends State<Available>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _isData = false;
  bool _isActiveData = false;
  bool _isCompleteData = false;

  TabController _tabController;

  List<dynamic> orderPackage = [];
  List<dynamic> orderShop = [];
  List<dynamic> orderRestaurant = [];

  List<dynamic> orderPackageActive = [];
  List<dynamic> orderShopActive = [];
  List<dynamic> orderRestaurantActive = [];

  List<dynamic> orderPackageComplete = [];
  List<dynamic> orderShopComplete = [];
  List<dynamic> orderRestaurantComplete = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.index = 0;
    availableOrders();
  }

  Future<void> availableOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/available_order.php',
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
        _isData = true;
      });
    } else {}
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
        orderPackageActive = responseData["order_package"];

        orderShopActive = responseData["order_shop"];
        orderRestaurantActive = responseData["order_restaurant"];

        setState(() {
          _isActiveData = true;
        });
      });
    } else {}
    completedOrders();
  }

  Future<void> completedOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/complete_order.php',
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
        orderPackageComplete = responseData["order_package"];

        orderShopComplete = responseData["order_shop"];
        orderRestaurantComplete = responseData["order_restaurant"];

        setState(() {
          _isCompleteData = true;
        });
      });
    } else {}
  }

  Widget orderWidget(int index, String orderid, String pickUpAddress,
      String dropAddress, List listData) {
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
                "Order-id: " + orderid,
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
                Text(
                  "Pickup Point : ",
                  style: TextStyle(
                    fontFamily: 'RobotoBold',
                    color: Color(0xFF27DEBF),
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
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
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Drop Point : ",
                  style: TextStyle(
                    fontFamily: 'RobotoBold',
                    color: Color(0xFF27DEBF),
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
                Expanded(
                  child: Text(
                    dropAddress,
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
                print(listData);
                Navigator.push(
                    context,
                    SlideLeftRoute(
                        page: Takeorder(
                      customer_name: listData[index]["first_name"] +
                          " " +
                          listData[index]["last_name"],
                      amount: listData[index]["order_total"],
                      description: listData[index]["comment"],
                      pickupaddress: listData[index]["pickup_address"],
                      pickuptime: listData[index]["pickup_time"],
                      dropaddress: listData[index]["delivery_address"],
                      droptime: listData[index]["delivery_time"],
                      pickupdate: listData[index]["pickup_date"],
                      dropdate: listData[index]["delivery_date"],
                      commission: listData[index]["commission"],
                      orderId: listData[index]["id"],
                      orderType: listData[index]["order_type"],
                    )));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Color(0xFF2BCDB4),
                  //border: Border.all(color: Colors.blueAccent),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
          ],
        ),
      ),
    );
  }

  Widget orderWidgetActive(int index, String orderid, String pickUpAddress,
      String dropAddress, List listData) {
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
                "Order-id: " + orderid,
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
                Text(
                  "Pickup Point : ",
                  style: TextStyle(
                    fontFamily: 'RobotoBold',
                    color: Color(0xFF27DEBF),
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
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
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Drop Point : ",
                  style: TextStyle(
                    fontFamily: 'RobotoBold',
                    color: Color(0xFF27DEBF),
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
                Expanded(
                  child: Text(
                    dropAddress,
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
                print(listData);
                Navigator.push(
                    context,
                    SlideLeftRoute(
                        page: Orderstatus(
                      customer_name: listData[index]["first_name"] +
                          " " +
                          listData[index]["last_name"],
                      amount: listData[index]["order_total"],
                      description: listData[index]["comment"],
                      pickupaddress: listData[index]["pickup_address"],
                      pickuptime: listData[index]["pickup_time"],
                      dropaddress: listData[index]["delivery_address"],
                      droptime: listData[index]["delivery_time"],
                      pickupdate: listData[index]["pickup_date"],
                      dropdate: listData[index]["delivery_date"],
                      commission: listData[index]["commission"],
                      customer_phnnumber: listData[index]["contact_number"],
                      orderId: listData[index]["id"],
                      orderType: listData[index]["order_type"],
                    )));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Color(0xFF2BCDB4),
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

  Widget orderWidgetComplete(int index, String orderid, String pickUpAddress,
      String dropAddress, List listData) {
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
                "Order-id: " + orderid,
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
                Text(
                  "Pickup Point : ",
                  style: TextStyle(
                    fontFamily: 'RobotoBold',
                    color: Color(0xFF27DEBF),
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
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
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Drop Point : ",
                  style: TextStyle(
                    fontFamily: 'RobotoBold',
                    color: Color(0xFF27DEBF),
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
                Expanded(
                  child: Text(
                    dropAddress,
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
                print(listData);
                /*Navigator.push(
                    context,
                    SlideLeftRoute(
                        page: Orderstatus(
                      customer_name: listData[index]["first_name"] +
                          listData[index]["last_name"],
                      amount: listData[index]["order_total"],
                      description: listData[index]["comment"],
                      pickupaddress: listData[index]["pickup_address"],
                      pickuptime: listData[index]["pickup_time"],
                      dropaddress: listData[index]["delivery_address"],
                      droptime: listData[index]["delivery_time"],
                      pickupdate: listData[index]["pickup_date"],
                      dropdate: listData[index]["delivery_date"],
                    )));*/
              },
              child: Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Color(0xFF2BCDB4),
                  //border: Border.all(color: Colors.blueAccent),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30.0),
                  ),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Details",
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
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: TabBar(
              controller: _tabController,
              /*onTap: (index) {
                print(_tabController.index);
              },*/
              //indicatorColor: Color(0xFF2BCDB4),
              //indicator: BoxDecoration(
              //color: Color(0xFF2BCDB4),
              //borderRadius: BorderRadius.circular(15),
              //),
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
            body: TabBarView(controller: _tabController, children: [
              Container(
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
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidget(
                                        index,
                                        orderPackage[index]["id"],
                                        orderPackage[index]["pickup_address"],
                                        orderPackage[index]["delivery_address"],
                                        orderPackage,
                                      );
                                    }),
                                ListView.builder(
                                    itemCount: orderShop.length,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidget(
                                        index,
                                        orderShop[index]["id"],
                                        orderShop[index]["pickup_address"],
                                        orderShop[index]["delivery_address"],
                                        orderShop,
                                      );
                                    }),
                                ListView.builder(
                                    itemCount: orderRestaurant.length,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidget(
                                          index,
                                          orderRestaurant[index]["id"],
                                          orderRestaurant[index]
                                              ["pickup_address"],
                                          orderRestaurant[index]
                                              ["delivery_address"],
                                          orderRestaurant);
                                    }),
                              ],
                            ),
                          );
                        },
                        itemCount: 1,
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
              Container(
                child: _isActiveData
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: <Widget>[
                                ListView.builder(
                                    itemCount: orderPackageActive.length,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidgetActive(
                                        index,
                                        orderPackageActive[index]["id"],
                                        orderPackageActive[index]
                                            ["pickup_address"],
                                        orderPackageActive[index]
                                            ["delivery_address"],
                                        orderPackageActive,
                                      );
                                    }),
                                ListView.builder(
                                    itemCount: orderShopActive.length,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidgetActive(
                                        index,
                                        orderShopActive[index]["id"],
                                        orderShopActive[index]
                                            ["pickup_address"],
                                        orderShopActive[index]
                                            ["delivery_address"],
                                        orderShopActive,
                                      );
                                    }),
                                ListView.builder(
                                    itemCount: orderRestaurantActive.length,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidgetActive(
                                          index,
                                          orderRestaurantActive[index]["id"],
                                          orderRestaurantActive[index]
                                              ["pickup_address"],
                                          orderRestaurantActive[index]
                                              ["delivery_address"],
                                          orderRestaurantActive);
                                    }),
                              ],
                            ),
                          );
                        },
                        itemCount: 1,
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
              Container(
                child: _isCompleteData
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: <Widget>[
                                ListView.builder(
                                    itemCount: orderPackageComplete.length,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidgetComplete(
                                        index,
                                        orderPackageComplete[index]["id"],
                                        orderPackageComplete[index]
                                            ["pickup_address"],
                                        orderPackageComplete[index]
                                            ["delivery_address"],
                                        orderPackageComplete,
                                      );
                                    }),
                                ListView.builder(
                                    itemCount: orderShopComplete.length,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidgetComplete(
                                        index,
                                        orderShopComplete[index]["id"],
                                        orderShopComplete[index]
                                            ["pickup_address"],
                                        orderShopComplete[index]
                                            ["delivery_address"],
                                        orderShopComplete,
                                      );
                                    }),
                                ListView.builder(
                                    itemCount: orderRestaurantComplete.length,
                                    shrinkWrap:
                                        true, // todo comment this out and check the result
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return orderWidgetComplete(
                                          index,
                                          orderRestaurantComplete[index]["id"],
                                          orderRestaurantComplete[index]
                                              ["pickup_address"],
                                          orderRestaurantComplete[index]
                                              ["delivery_address"],
                                          orderRestaurantComplete);
                                    }),
                              ],
                            ),
                          );
                        },
                        itemCount: 1,
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            ])),
      ),
    );
  }
}
