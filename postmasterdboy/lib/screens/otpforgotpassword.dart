import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postmasterdboy/Components/customicons.dart';
//import 'package:postmaster/Screens/SetPassword.dart';
//import 'package:postmaster/Screens/Signup.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:postmasterdboy/screens/setforgotpassword.dart';

class Otpclass extends StatefulWidget {
  @override
  _OtpclassState createState() => _OtpclassState();
}

class _OtpclassState extends State<Otpclass> {
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
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
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
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
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
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
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
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
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
                          autofocus: true,
                          obscureText: true,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            pin5FocusNode.unfocus();
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 50.0),
              InkWell(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: Setpassword()));
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
                        onTap: () {},
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
}
