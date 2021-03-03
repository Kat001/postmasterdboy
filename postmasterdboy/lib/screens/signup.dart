import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';

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
                        hintText: 'Mobile Number',
                        prefixText: "+91 "
                        //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                        ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
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

  /* Future<http.Response> loginUser() async {
    String user_id = user_idController.text;
    String user_pass = user_passController.text;

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/login.php',
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
      var data = responseData["user_details"];
      //SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', responseData['token']);
      prefs.setString('first_name', data['first_name']);
      prefs.setString('last_name', data['last_name']);
      prefs.setString('email', data['email']);
      prefs.setString('phn_number', data['phn_number']);
      //SharedPreferences prefs = await SharedPreferences.getInstance();

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Dashboard()));

      ToastUtils.showCustomToast(context, "Sign in Successfully");
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    }
    return res;
  }*/
}
