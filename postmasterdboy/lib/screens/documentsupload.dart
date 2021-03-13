import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/animate.dart';

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
                    showAadhaarFrontDownPopUp();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 190.0, right: 33.0, bottom: 5.0),
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
                    showAadhaarBackDownPopUp();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 190.0, right: 33.0, bottom: 5.0),
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
                  child: getImageWidget(_drivingLicenceFrontFile),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, bottom: 5.0),
                  child: Text(
                    "Please upload in pdf,jpeg",
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDrivingLicenceFrontDownPopUp();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 190.0, right: 33.0, bottom: 5.0),
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
                InkWell(
                  onTap: () {
                    showDrivingLicenceBackPopUp();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 190.0, right: 33.0, bottom: 5.0),
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
                InkWell(
                  onTap: () {
                    showPassportPopUp();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 190.0, right: 33.0, bottom: 5.0),
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
                InkWell(
                  onTap: () {
                    showPucPopUp();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 190.0, right: 33.0, bottom: 5.0),
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
                InkWell(
                  onTap: () {
                    showRcBookPopUp();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 190.0, right: 33.0, bottom: 5.0),
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
                    uploadDocuments();
                  },
                  child: Container(
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
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadDocuments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    print(token);
    Dio dio = new Dio();

    FormData data = FormData.fromMap({
      "aadhar_front": await MultipartFile.fromFile(
        _aadhaarCardFrontFile.path,
        filename: _aadhaarCardFrontFile.path.split('/').last,
      ),
      "aadhar_back": await MultipartFile.fromFile(
        _aadhaarCardBackFile.path,
        filename: _aadhaarCardBackFile.path.split('/').last,
      ),
      "license_front": await MultipartFile.fromFile(
        _drivingLicenceFrontFile.path,
        filename: _drivingLicenceFrontFile.path.split('/').last,
      ),
      "license_back": await MultipartFile.fromFile(
        _drivingLicenceBackFile.path,
        filename: _drivingLicenceBackFile.path.split('/').last,
      ),
      "puc": await MultipartFile.fromFile(
        _pucFile.path,
        filename: _pucFile.path.split('/').last,
      ),
      "rcbook": await MultipartFile.fromFile(
        _rcBookFile.path,
        filename: _rcBookFile.path.split('/').last,
      ),
      "passport": await MultipartFile.fromFile(
        _passportFile.path,
        filename: _passportFile.path.split('/').last,
      ),
    });

    dio.options.headers["Authorization"] = token;
    /*dio.options.headers["account_number"] = accountNumberController.text;
    dio.options.headers["bank_name"] = bankNameController.text;
    dio.options.headers["ifsc_code"] = ifscController.text;
    dio.options.headers["branch"] = branchNameController.text;*/

    dio
        .post(
      "https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/document_upload.php",
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

  showAadhaarFrontDownPopUp() {
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
                  getAadhaarFrontImage(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getAadhaarFrontImage(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getAadhaarFrontImage(
    ImageSource source,
  ) async {
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
        _aadhaarCardFrontFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  showAadhaarBackDownPopUp() {
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
                  getAadhaarBackImage(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getAadhaarBackImage(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getAadhaarBackImage(
    ImageSource source,
  ) async {
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
        _aadhaarCardBackFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  showDrivingLicenceFrontDownPopUp() {
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
                  getDrivingLicenceFrontImage(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getDrivingLicenceFrontImage(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getDrivingLicenceFrontImage(
    ImageSource source,
  ) async {
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
        _drivingLicenceFrontFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  showDrivingLicenceBackPopUp() {
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
                  getDrivingLicenceBackImage(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getDrivingLicenceBackImage(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getDrivingLicenceBackImage(
    ImageSource source,
  ) async {
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
        _drivingLicenceBackFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  showPassportPopUp() {
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
                  getPassportImage(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getPassportImage(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getPassportImage(
    ImageSource source,
  ) async {
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
        _passportFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  showPucPopUp() {
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
                  getPucImage(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getPucImage(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getPucImage(
    ImageSource source,
  ) async {
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
        _pucFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  showRcBookPopUp() {
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
                  getRcBookImage(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  getRcBookImage(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ])
          ],
        ),
      ),
    );
  }

  getRcBookImage(
    ImageSource source,
  ) async {
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
        _rcBookFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }
}
