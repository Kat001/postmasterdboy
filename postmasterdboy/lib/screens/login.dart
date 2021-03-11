import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:postmasterdboy/screens/forgotpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//import 'package:http/http.dart' as http;
//import 'package:flutter/services.dart';

//import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:convert';

import 'package:postmasterdboy/screens/homepage.dart';
import 'package:postmasterdboy/screens/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formKey = GlobalKey<FormState>();
  final TextEditingController user_idController = TextEditingController();
  final TextEditingController user_passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              //Navigator.push(context, SlideRightRoute(page: Homepage()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: new EdgeInsets.only(top: 1, right: 35, left: 35),
                  child: Image(
                    image: AssetImage('assets/images/logins.png'),
                    height: 266.0,
                    width: 266.0,
                  ),
                ),
                Center(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 25.0),
                  child: Text(
                    "Add yout details to login",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
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
                    controller: user_idController,
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
                      hintText: 'Email or Phone Numbers',
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
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
                    controller: user_passController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter password.";
                      }
                      if (value.length < 8) {
                        return "Password length must be graeter than or equal to 8.";
                      }
                      /*if (!EmailValidator.validate(value)) {
                          return "Enter valid email";
                        }*/
                      //return "";
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 40, bottom: 11, top: 11, right: 15),
                      hintText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      loginUser();
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
                          "Login",
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
                InkWell(
                  onTap: () {
                    Navigator.push(context, SlideRightRoute(page: Signup()));
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
                          "Create Account",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: new EdgeInsets.only(
                            bottom: 30, top: 40.0, left: 75),
                        child: Text(
                          "- Forgot Password -",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF707070), fontSize: 16.0),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, SlideLeftRoute(page: Forgotpassword()));
                        },
                        child: Container(
                          margin: new EdgeInsets.only(
                            bottom: 30,
                            top: 40.0,
                          ),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<http.Response> loginUser() async {
    String user_id = user_idController.text;
    String user_pass = user_passController.text;

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/login.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "user_id": user_id,
        "password": user_pass,
      },
    );
    print(res.body);
    var responseData = json.decode(res.body);
    print(responseData['token']);
    if (responseData['success'] == 1) {
      var data = responseData["delivery_boy_user_details"];
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', responseData['token']);
      prefs.setString('first_name', data['first_name']);
      prefs.setString('last_name', data['last_name']);
      prefs.setString('email', data['email']);
      prefs.setString('phn_number', data['phn_number']);
      prefs.setBool("duty", true);

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Homepage()));

      ToastUtils.showCustomToast(context, "Sign in Successfully");
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    }
    return res;
  }
}
