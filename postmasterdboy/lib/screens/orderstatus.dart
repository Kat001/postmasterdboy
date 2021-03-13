import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/screens/customersign.dart';
import 'package:postmasterdboy/screens/homepage.dart';
import 'package:postmasterdboy/screens/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postmasterdboy/Components/animate.dart';

class Orderstatus extends StatefulWidget {
  Orderstatus({
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
    this.customer_phnnumber,
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
  final String customer_phnnumber;
  final String orderId;
  final String orderType;

  @override
  _OrderstatusState createState() => _OrderstatusState();
}

class _OrderstatusState extends State<Orderstatus> {
  int _radioValue = 10;
  bool _isdata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchStatus();
  }

  Future<http.Response> fetchStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map data = {"order_id": widget.orderId, "order_type": widget.orderType};
    var body = json.encode(data);

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/order_status.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": token
      },
      body: body,
    );

    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      setState(() {
        _radioValue = int.parse(responseData["order_status"]);
        _isdata = true;
      });
    }
    return res;
  }

  void _handleRadioValueChange(int value) {
    if (value == 1) {
      changeStatus("picked");
    }
    if (value == 2) {
      changeStatus("ontheway");
    }

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
      body: _isdata
          ? SingleChildScrollView(
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
                        "Pickup Date",
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
                        "widget.pickupdate",
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
                                'Active',
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
                                'Picked Up',
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
                                'On The Way',
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
                        Navigator.push(
                            context, SlideLeftRoute(page: Customersign()));
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
                        margin:
                            const EdgeInsets.only(top: 5, left: 40, right: 40),
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
                          margin:
                              EdgeInsets.only(left: 30, top: 10, bottom: 10),
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
                                      "₹" + widget.amount,
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
                                    child: widget.commission == null
                                        ? Text(
                                            "",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoBold',
                                              fontSize:
                                                  displayWidth(context) * 0.05,
                                            ),
                                          )
                                        : Text(
                                            "₹" + widget.commission,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'RobotoBold',
                                              fontSize:
                                                  displayWidth(context) * 0.05,
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
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Future<http.Response> changeStatus(String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map data = {
      "order_id": widget.orderId,
      "order_type": widget.orderType,
      "order_status": status,
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
      showDialog(
        context: context,
        builder: (context) =>
            CustomDialog("Success", responseData['message'], "Okay", 2),
      );
      Navigator.push(context, SlideLeftRoute(page: Homepage()));
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    }
    return res;
  }
}
