import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//import 'package:postmaster/Screens/SetPassword.dart';
//import 'package:postmaster/Screens/Signup.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:postmasterdboy/screens/setforgotpassword.dart';

class Otpclass extends StatefulWidget {
  Otpclass({
    Key key,
    this.phn_number,
  }) : super(key: key);
  final String phn_number;
  @override
  _OtpclassState createState() => _OtpclassState();
}

class _OtpclassState extends State<Otpclass> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  final TextEditingController _fifthController = TextEditingController();
  final TextEditingController _sixthController = TextEditingController();

  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
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
            onPressed: () {
              /*Navigator.push(context, SlideRightRoute(page: Signup()));*/
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: new EdgeInsets.only(top: 0, bottom: 20),
                // child: Image(
                //   image: AssetImage('assets/images/otppic.jpg'),
                //   height: 266.0,
                //   width: 266.0,
                // ),
                child: SvgPicture.asset(
                  otppic,
                  height: 266.0,
                ),
              ),
              Center(
                  child: Container(
                margin: EdgeInsets.only(bottom: 7.0),
                child: Opacity(
                  opacity: 0.7,
                  child: Text(
                    "We have sent an OTP to ",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30,
                    ),
                  ),
                ),
              )),
              Center(
                  child: Container(
                margin: EdgeInsets.only(bottom: 25.0),
                child: Opacity(
                  opacity: 0.7,
                  child: Text(
                    "your mobile ",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30,
                    ),
                  ),
                ),
              )),
              Center(
                  child: Container(
                margin: EdgeInsets.only(bottom: 5.0, left: 25, right: 25),
                child: Opacity(
                  opacity: 0.4,
                  child: Text(
                    "Please cheak your mobile number 071*****90",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
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
                    "continue to reset your password",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                    ),
                  ),
                ),
              )),
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: TextFormField(
                          controller: _firstController,
                          maxLength: 1,
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            nextField(value, pin2FocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: TextFormField(
                          focusNode: pin2FocusNode,
                          controller: _secondController,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          maxLength: 1,
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            counterText: "",
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            nextField(value, pin3FocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: TextFormField(
                          focusNode: pin3FocusNode,
                          controller: _thirdController,
                          maxLength: 1,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            nextField(value, pin4FocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: TextFormField(
                          focusNode: pin4FocusNode,
                          controller: _fourthController,
                          maxLength: 1,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            nextField(value, pin5FocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: TextFormField(
                          focusNode: pin5FocusNode,
                          controller: _fifthController,
                          maxLength: 1,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            nextField(value, pin6FocusNode);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: TextFormField(
                          focusNode: pin6FocusNode,
                          controller: _sixthController,
                          maxLength: 1,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            pin6FocusNode.unfocus();
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 50.0),
              InkWell(
                onTap: () {
                  verifyUser();
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
                        "Next",
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
                      margin:
                          new EdgeInsets.only(bottom: 30, top: 40.0, left: 75),
                      child: Text(
                        "Did't Receve?",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFF707070), fontSize: 16.0),
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.only(
                        bottom: 30,
                        top: 40.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          reSendOtp();
                        },
                        child: Text(
                          " Click Here",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.green[400], //Color(0xFF27DEBF),
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
    );
  }

  Future<http.Response> verifyUser() async {
    String code = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _fourthController.text +
        _fifthController.text +
        _sixthController.text;

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/forgot_password_verify_otp.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'phn_number': widget.phn_number,
        'otp': code,
      },
    );

    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      Navigator.push(
          context,
          SlideLeftRoute(
              page: Setpassword(
            phn_number: widget.phn_number,
          )));
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    }
    return res;
  }

  Future<http.Response> reSendOtp() async {
    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/forgot_password.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "phn_number": widget.phn_number,
      },
    );

    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Success", responseData['message'], "Cancel"));
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

      return res;
    }
  }
}
