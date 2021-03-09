import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Documentupload extends StatefulWidget {
  @override
  _DocumentuploadState createState() => _DocumentuploadState();
}

class _DocumentuploadState extends State<Documentupload> {
  var _formKey = GlobalKey<FormState>();
  final TextEditingController user_idController = TextEditingController();
  final TextEditingController user_passController = TextEditingController();

  //File _selectedFile;
  File _aadhaarCardFrontFile;
  File _aadhaarCardBackFile;
  File _drivingLicenceFrontFile;
  File _drivingLicenceBackFile;
  File _passportFile;
  File _pucFile;
  File _rcBookFile;

  bool _inProcess = false;

  Widget getImageWidget(File _selectedFile) {
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

  showDownPopUp(File _selectedFile) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  getImage(ImageSource.camera, _selectedFile);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getImage(ImageSource.gallery, _selectedFile);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getImage(ImageSource source, File _selectedFile) async {
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
        if (_selectedFile == _aadhaarCardFrontFile) {
          _aadhaarCardFrontFile = cropped;
          _inProcess = false;
        }
        if (_selectedFile == _aadhaarCardBackFile) {
          _aadhaarCardBackFile = cropped;
          _inProcess = false;
        }
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
                  child: Opacity(
                    opacity: 0.8,
                    child: Text(
                      "Documents Uploads",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 35,
                      ),
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Aadhaar card front(Required)",
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
                  child: getImageWidget(_aadhaarCardFrontFile),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDownPopUp(_aadhaarCardFrontFile);
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
                        margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Aadhaar card back(Required)",
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
                  child: getImageWidget(_aadhaarCardBackFile),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDownPopUp(_aadhaarCardBackFile);
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
                        margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Driving Licence front(Required)",
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
                  child: getImageWidget(_drivingLicenceBackFile),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                Container(
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
                      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Driving Licence back(Required)",
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
                  child: getImageWidget(_drivingLicenceBackFile),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                Container(
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
                      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Passport",
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
                  child: getImageWidget(_passportFile),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                Container(
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
                      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "P.U.C",
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
                  child: getImageWidget(_pucFile),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                Container(
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
                      margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "RC Book(Required)",
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
                  child: getImageWidget(_rcBookFile),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                Container(
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
                SizedBox(height: 15.0),
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
                        "Done",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            color: Colors.white),
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
