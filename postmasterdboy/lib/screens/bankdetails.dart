import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/animate.dart';

class Bankdetail extends StatefulWidget {
  @override
  _BankdetailState createState() => _BankdetailState();
}

class _BankdetailState extends State<Bankdetail> {
  var _formKey = GlobalKey<FormState>();

  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController confirmAccountNumberController =
      TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController branchNameController = TextEditingController();

  File _selectedFile;
  bool _inProcess = false;

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/placeholder.jpg",
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    }
  }

  getImage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    File image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          ));

      this.setState(() {
        _selectedFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

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
              Navigator.pop(context);
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
                  child: Opacity(
                    opacity: 0.8,
                    child: Text(
                      "Bank Details",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 35,
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
                    controller: bankNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter va;lid bank name.";
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
                      hintText: 'Bank Name',
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
                    controller: accountNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid account number.";
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
                      hintText: 'Account Number',
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
                    controller: confirmAccountNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
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
                      hintText: 'Confirm Account Number',
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
                    controller: ifscController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid IFSC code.";
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
                      hintText: 'IFSC code',
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
                    controller: branchNameController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter valid branch name.";
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
                      hintText: 'Branch',
                      //hintStyle: TextStyle(fontSize: 20.0, color: Colors.redAccent,fontWeight: ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Cancel cheque(Required)",
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'robotobold',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 33.0, right: 33.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),
                    ),
                  ),
                  child: getImageWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                onPressed: () {
                                  getImage(ImageSource.camera);
                                },
                                label: Text("Camera"),
                              ),
                              FlatButton.icon(
                                icon: Icon(Icons.image),
                                onPressed: () {
                                  getImage(ImageSource.gallery);
                                },
                                label: Text("Gallery"),
                              ),
                            ])
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 190.0, right: 33.0, bottom: 5.0),
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
                        margin: EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                        ),
                        child: Text(
                          "Upload",
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
                    if (_formKey.currentState.validate()) {
                      if (accountNumberController.text ==
                          confirmAccountNumberController.text) {
                        saveBankData();
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialogError("Error",
                                "Account number should be same", "Cancel"));
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
                          "Finish",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveBankData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    print(token);
    Dio dio = new Dio();

    FormData data = FormData.fromMap({
      "cancel_cheque_image": await MultipartFile.fromFile(
        _selectedFile.path,
        filename: _selectedFile.path.split('/').last,
      ),
    });

    dio.options.headers["Authorization"] = token;
    dio.options.headers["account_number"] = accountNumberController.text;
    dio.options.headers["bank_name"] = bankNameController.text;
    dio.options.headers["ifsc_code"] = ifscController.text;
    dio.options.headers["branch"] = branchNameController.text;

    dio
        .post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/add_bank_detail.php',
      data: data,
    )
        .then((response) {
      var jsonResponse = jsonDecode(response.toString());
      if (jsonResponse['status'] == 200) {
        showDialog(
          context: context,
          builder: (context) =>
              CustomDialog("Success", jsonResponse['message'], "Okay", 2),
        );
      } else {
        showDialog(
            context: context,
            builder: (context) =>
                CustomDialogError("Error", jsonResponse['message'], "Cancel"));
      }
      // var testData = jsonResponse['histogram_counts'].cast<double>();
      // var averageGrindSize = jsonResponse['average_particle_size'];
    }).catchError((error) => print(error));

    /*print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {
      showDialog(
        context: context,
        builder: (context) =>
            CustomDialog("Success", responseData['message'], "Okay", 2),
      );
      //Navigator.push(context, SlideLeftRoute(page: Profile()));
    } else if (responseData['status'] == 500) {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", "User already Exists", "Cancel"));
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              CustomDialogError("Error", responseData['message'], "Cancel"));
    }*/
  }
}
