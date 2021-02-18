import 'package:flutter/material.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/screens/bankdetails.dart';
import 'package:postmasterdboy/screens/forgotpassword.dart';
import 'package:postmasterdboy/screens/homepage.dart';
import 'package:postmasterdboy/screens/otpforgotpassword.dart';
import 'package:postmasterdboy/screens/login.dart';
import 'package:postmasterdboy/screens/otpsignup.dart';
import 'package:postmasterdboy/screens/profile.dart';
import 'package:postmasterdboy/screens/setforgotpassword.dart';
import 'package:postmasterdboy/screens/setsignuppassword.dart';
import 'package:postmasterdboy/screens/signup.dart';
import 'package:postmasterdboy/screens/documentsupload.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    //autoLogIn();
  }

  /* void autoLogIn() async {
   // final SharedPreferences prefs = await SharedPreferences.getInstance();
    //final String token = prefs.getString('token');

    if (token != null) {
      setState(() {
        isLoggedIn = true;
      });

      return;
    } else {
      setState(() {
        isLoggedIn = false;
      });

      return;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Postman",
              theme: ThemeData(
                primaryColor: Color(0xFF27DEBF),
                dividerColor: Colors.transparent,
              ),
              home: Login(), //Mysubscription(),
            );
          },
        );
      },
    );
  }
}
