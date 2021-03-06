import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:postmasterdboy/Components/animate.dart';

class Leaveapplication extends StatefulWidget {
  @override
  _LeaveapplicationState createState() => _LeaveapplicationState();
}

class _LeaveapplicationState extends State<Leaveapplication> {
  var _formKey = GlobalKey<FormState>();
  final TextEditingController _leaveTypeController = TextEditingController();
  final TextEditingController _leaveReasonController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime _dateTime;
    TimeOfDay _time = TimeOfDay.now();
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 25.0, left: 20.0),
                  child: Text(
                    "Leave",
                    style: TextStyle(
                      fontFamily: 'RobotoBold',
                      color: Colors.green,
                      fontSize: 25,
                      letterSpacing: 1.2,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 33.0, right: 33.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  child: TextFormField(
                    controller: _leaveTypeController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid leave type.";
                      }
                      /*if (!EmailValidator.validate(value)) {
                          return "Enter valid email";
                        }*/
                      //return "";
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 40, bottom: 11, top: 11, right: 15),
                      hintText: 'Leave Type',
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: const EdgeInsets.only(left: 33.0, right: 33.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  child: TextFormField(
                    controller: _leaveReasonController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid Reason.";
                      }
                      /*if (!EmailValidator.validate(value)) {
                          return "Enter valid email";
                        }*/
                      //return "";
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 40, bottom: 11, top: 11, right: 15),
                      hintText: 'Leave Reason',
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: const EdgeInsets.only(left: 33.0, right: 33.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  child: TextFormField(
                    controller: _fromDateController,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: _dateTime == null
                                  ? DateTime.now()
                                  : _dateTime,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2022))
                          .then((date) {
                        setState(() {
                          //_dateTime = date;
                          if (date != null) {
                            _fromDateController.text =
                                date.toString().substring(0, 10);
                          }
                        });
                      });
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid username.";
                      }
                      /*if (!EmailValidator.validate(value)) {
                          return "Enter valid email";
                        }*/
                      //return "";
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 40, bottom: 11, top: 11, right: 15),
                      hintText: 'From',
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: const EdgeInsets.only(left: 33.0, right: 33.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  child: TextFormField(
                    controller: _toDateController,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: _dateTime == null
                                  ? DateTime.now()
                                  : _dateTime,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2022))
                          .then((date) {
                        setState(() {
                          //_dateTime = date;
                          if (date != null) {
                            _toDateController.text =
                                date.toString().substring(0, 10);
                          }
                        });
                      });
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "To";
                      }
                      /*if (!EmailValidator.validate(value)) {
                          return "Enter valid email";
                        }*/
                      //return "";
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 40, bottom: 11, top: 11, right: 15),
                      hintText: 'To',
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(height: 15.0),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      leaveAppliccation();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 33.0, right: 33.0),
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
                        margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<http.Response> leaveAppliccation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map data = {
      "leave_type": _leaveTypeController.text,
      "leave_reason": _leaveReasonController.text,
      "from_date": _fromDateController.text,
      "to_date": _toDateController.text,
      "comment": "Anything"
    };
    var body = json.encode(data);
    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/leave_application.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": token,
      },
      body: body,
    );
    print(res.body);
    var responseData = json.decode(res.body);

    if (responseData['status'] == 200) {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Success", responseData['message'], "Cancel"));
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    }
    return res;
  }
}
