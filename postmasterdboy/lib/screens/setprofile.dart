import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/screens/profile.dart';
import 'package:postmasterdboy/screens/resetpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:postmasterdboy/Components/animate.dart';

class Setprofile extends StatefulWidget {
  @override
  _SetprofileState createState() => _SetprofileState();
}

class _SetprofileState extends State<Setprofile> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchInformation();
  }

  Future fetchInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //firstName = prefs.getString("first_name");
    //print("first:" + firstName);

    setState(() {
      _firstNameController.text = prefs.getString("first_name");
      _lastNameController.text = prefs.getString("last_name");
      _emailController.text = prefs.getString("email");
      _phoneController.text = prefs.getString("phn_number");
    });
  }

  Widget imageProfile() {
    return Center(
      child: Center(
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/profilepic.png'),
            ),
            Positioned(
                bottom: 20.0,
                right: 20.0,
                child: InkWell(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                "Chose profile photo",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              SizedBox(height: 20),
                              Row(children: <Widget>[
                                FlatButton.icon(
                                  icon: Icon(Icons.camera),
                                  onPressed: () {},
                                  label: Text("Camera"),
                                ),
                                FlatButton.icon(
                                  icon: Icon(Icons.image),
                                  onPressed: () {},
                                  label: Text("Gallery"),
                                ),
                              ])
                            ],
                          ),
                        ),
                      );
                    },
                    child:
                        Icon(Icons.camera_alt, color: Colors.teal, size: 28.0)))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                Center(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 25.0),
                  child: Text(
                    "Personal details",
                    style: TextStyle(
                      fontFamily: 'RobotoBold',
                      fontSize: 25,
                    ),
                  ),
                )),
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
                    controller: _firstNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter first name.";
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
                      hintText: 'first name',
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
                    controller: _lastNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter last name.";
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
                      hintText: 'Last name',
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
                    controller: _emailController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid email.";
                      }
                      if (!EmailValidator.validate(value)) {
                        return "Enter valid email";
                      }
                      //return "";
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 40, bottom: 11, top: 11, right: 15),
                      hintText: 'email',
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
                    controller: _phoneController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Enter Phone number";
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
                      hintText: 'Phone Numbers',
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(height: 15.0),
                Container(
                  margin: const EdgeInsets.only(left: 33.0, right: 33.0),
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
                        "Save",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Container(
                        margin: new EdgeInsets.only(
                            bottom: 30, top: 30.0, left: 50),
                        child: Text(
                          "- Change Password -",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF707070), fontSize: 16.0),
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.only(bottom: 30, top: 30.0),
                        child: InkWell(
                          onTap: () {},
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  SlideLeftRoute(page: SetNewPassword()));
                            },
                            child: Text(
                              " Click Here",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF27DEBF),
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<http.Response> updateUser() async {
    Map data = {
      "name": "TEST BHAI",
      "email": _emailController.text,
      "phn_number": _phoneController.text,
      "address": "TEST"
    };
    var body = json.encode(data);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/update_personal_details.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
      },
      body: body,
    );

    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      prefs.setString("first_name", _firstNameController.text);
      prefs.setString("last_name", _lastNameController.text);
      prefs.setString("email", _emailController.text);
      prefs.setString("phn_number", _phoneController.text);
      showDialog(
        context: context,
        builder: (context) =>
            CustomDialog("Success", responseData['message'], "Okay", 2),
      );
      Navigator.push(context, SlideLeftRoute(page: Profile()));
    } else if (responseData['status'] == 500) {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    }
    return res;
  }
}
