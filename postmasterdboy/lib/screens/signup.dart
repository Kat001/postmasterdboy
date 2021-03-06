import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:postmasterdboy/screens/otpsignup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postmasterdboy/Components/toast_utils.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController referenceOneNameController =
      TextEditingController();
  final TextEditingController referenceOneMobileNumberController =
      TextEditingController();
  final TextEditingController referenceTwoNameController =
      TextEditingController();
  final TextEditingController referenceTwoMobileNumberController =
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
                    height: 250.0,
                    width: 266.0,
                  ),
                ),
                Center(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Opacity(
                    opacity: 0.8,
                    child: Text(
                      "Sign Up",
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
                      "add your details to create account",
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
                    controller: firstNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid name.";
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
                      hintText: 'First Name',
                      //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                    controller: lastNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid last name.";
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
                      hintText: 'Last Name',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                    controller: emailIdController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid email.";
                      }
                      if (!EmailValidator.validate(value)) {
                        return "Enter valid email";
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
                      hintText: 'E-mail Id',
                      //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                    controller: mobileNumberController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid mobile number.";
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
                      hintText: 'Mobile Number',
                      prefixText: '+91 ',

                      //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 33),
                  child: Text(
                    "Reference 1",
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'robotobold',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                    controller: referenceOneNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 40, bottom: 11, top: 11, right: 15),
                      hintText: 'Name',
                      //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                    controller: referenceOneMobileNumberController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 40, bottom: 11, top: 11, right: 15),
                        hintText: 'Mobile Number',
                        prefixText: "+91 "
                        //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                        ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 33),
                  child: Text(
                    "Reference 2",
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'robotobold',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                    controller: referenceTwoNameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 40, bottom: 11, top: 11, right: 15),
                      hintText: 'Name',
                      //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
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
                    controller: referenceTwoMobileNumberController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 40, bottom: 11, top: 11, right: 15),
                        hintText: 'Mobile Number',
                        prefixText: "+91 "
                        //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                        ),
                  ),
                ),
                SizedBox(height: 10.0),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      createUser();
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
                          "Already have an account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF707070), fontSize: 16.0),
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.only(
                          bottom: 30,
                          top: 40.0,
                        ),
                        child: Text(
                          " Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.green[400],
                              fontSize: 16.0,
                              fontFamily: 'Roboto'),
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

  Future<http.Response> createUser() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailIdController.text;
    String phn_number1 = mobileNumberController.text;

    Map data = {
      "phn_number": phn_number1,
      "email": email,
    };
    var body = json.encode(data);
    print(phn_number1);

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/register_send_otp.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "phn_number": phn_number1,
        "email": email,
      },
    );

    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      Navigator.push(
          context,
          SlideLeftRoute(
              page: Otpsignup(
            phn_number: phn_number1,
            first_name: firstNameController.text,
            last_name: lastNameController.text,
            email: emailIdController.text,
            first_rf_name: referenceOneNameController.text,
            first_rf_mobile: referenceOneMobileNumberController.text,
            second_rf_name: referenceTwoNameController.text,
            second_rf_mobile: referenceTwoMobileNumberController.text,
          )));
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
