import 'package:flutter/material.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:flutter/services.dart';
import 'package:postmasterdboy/screens/login.dart';

class Setsignuppassword extends StatefulWidget {
  Setsignuppassword({
    Key key,
    this.phn_number,
    this.first_name,
    this.last_name,
    this.email,
    this.first_rf_name,
    this.first_rf_mobile,
    this.second_rf_name,
    this.second_rf_mobile,
  }) : super(key: key);

  final String phn_number;
  final String first_name;
  final String last_name;
  final String email;
  final String first_rf_name;
  final String first_rf_mobile;
  final String second_rf_name;
  final String second_rf_mobile;
  @override
  _SetsignuppasswordState createState() => _SetsignuppasswordState();
}

class _SetsignuppasswordState extends State<Setsignuppassword> {
  var _formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
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
                    image: AssetImage('assets/images/setpass.jpg'),
                    height: 266.0,
                    width: 266.0,
                  ),
                ),
                Center(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Set Password",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                      ),
                    ),
                  ),
                )),
                Center(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 25.0, left: 25, right: 25),
                  child: Opacity(
                    opacity: 0.4,
                    child: Text(
                      "Make a strong password",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                      ),
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
                    controller: newPasswordController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid password.";
                      }
                      if (value.length < 8) {
                        return "Password length must be greater than 8.";
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
                      hintText: 'New Password',
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
                    controller: confirmNewPasswordController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid username.";
                      }
                      if (value.length < 8) {
                        return "Password length must be greater than 8.";
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
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      if (newPasswordController.text ==
                          confirmNewPasswordController.text) {
                        savePassword();
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialogError(
                                "Error", "password must be same", "Cancel"));
                      }
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
                          "Done",
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
        ),
      ),
    );
  }

  Future<http.Response> savePassword() async {
    String pass = newPasswordController.text;

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/register.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "first_name": widget.first_name,
        "last_name": widget.last_name,
        "email": widget.email,
        "password": pass,
        "phn_number": widget.phn_number,
        "first_rf_name": widget.first_rf_name,
        "first_rf_mobile": widget.first_rf_mobile,
        "second_rf_name": widget.second_rf_name,
        "second_rf_mobile": widget.second_rf_mobile
      },
    );
    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 201) {
      print("jhkjasdhjk");
      Navigator.push(context, SlideLeftRoute(page: Login()));
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
