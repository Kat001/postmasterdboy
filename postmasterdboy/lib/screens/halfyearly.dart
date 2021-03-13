import 'package:flutter/material.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Halfyear extends StatefulWidget {
  @override
  _HalfyearState createState() => _HalfyearState();
}

class _HalfyearState extends State<Halfyear> {
  String cash = "";
  String cashless = "";
  String totalcommission = "";
  String nor = "";
  String cod = "";
  bool _isdata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    Map data = {
      "duration": "quarter",
    };
    var body = json.encode(data);
    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/cash_cashless_commission_cod_noofrides.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
      body: body,
    );
    //print(res.body);
    var responseData = json.decode(res.body);

    if (responseData["status"] == 200) {
      setState(() {
        cash = responseData["cash"].toString();
        cashless = responseData["cash_less"].toString();
        totalcommission = responseData["comission"].toString();
        nor = responseData["no_of_rides"].toString();
        cod = responseData["total_cod"].toString();
        _isdata = true;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isdata
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: orderWidget(
                        "Cash/Cashless",
                        "₹" + cash + "/" + cashless,
                      )),
                      Expanded(
                          child: orderWidget(
                        "Total Commission",
                        "₹" + totalcommission,
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: orderWidget(
                        "Number Of Rides",
                        nor,
                      )),
                      Expanded(
                          child: orderWidget(
                        "Total Cod Recieved",
                        "₹" + cod,
                      )),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(left: 50.0, right: 50.0),
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
                          margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            "Withdrawal",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget orderWidget(
    String key,
    String value,
  ) {
    return new Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF2BCDB4), width: 5.0),
          //shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ] //Color(0xFFE4EDEF),
          /*boxShadow: [
             BoxShadow(
              color: Color(0xFFF0F0F0),
              blurRadius: 5.0,
              spreadRadius: 5.0,
            )
          ]*/
          ),
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                key + ":",
                style: TextStyle(
                  fontFamily: "RobotoBold",
                  fontSize: displayWidth(context) * 0.05,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.arrow_right,
                  color: Color(0xFF2BCDB4),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      value,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: displayWidth(context) * 0.05,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
