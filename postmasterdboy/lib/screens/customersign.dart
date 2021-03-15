import 'package:flutter/material.dart';
import 'dart:io' as Io;

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';
import 'package:flutter_uploader/flutter_uploader.dart';

import 'package:postmasterdboy/Components/toast_utils.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/screens/information.dart';
//import 'package:postmasterdboy/screens/takeorder2.dart';

import 'package:postmasterdboy/screens/setprofile.dart';
import 'package:postmasterdboy/screens/chat.dart';
import 'package:postmasterdboy/screens/available.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:postmasterdboy/screens/signature.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class Customersign extends StatefulWidget {
  Customersign({
    Key key,
    this.customer_phnnumber,
    this.orderId,
    this.orderType,
  }) : super(key: key);

  final String customer_phnnumber;
  final String orderId;
  final String orderType;
  @override
  _CustomersignState createState() => _CustomersignState();
}

class _CustomersignState extends State<Customersign> {
  GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();
  final TextEditingController _fifthController = TextEditingController();
  final TextEditingController _sixthController = TextEditingController();

  Image _sign;
  File uploadFile; //= Io.File("file_01.tmp");
  Future<File> img;

  @override
  void initState() {
    super.initState();
    //deliverNowotp();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
    //uploadFile.writeAsStringSync('');
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

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState.clear();
    setState(() {
      uploadFile = null;
      deleteFile();
    });
  }

  void _handleSaveButtonPressed() async {
    final data = await signatureGlobalKey.currentState.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    var savedDir = await getApplicationDocumentsDirectory();
    String appDocPath = savedDir.path;

    if (data != null) {
      setState(() {
        _sign = Image.memory(bytes.buffer.asUint8List());
      });

      writeToFile(bytes).then((value) {
        setState(() {
          uploadFile = value;
        });
      });

      if (uploadFile == null) {
        print("Null hi hai bhai");
      } else {
        print("na deta hai");
      }
    }
  }

  Future<File> writeToFile(ByteData data) async {
    final buffer = data.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath =
        tempPath + '/file_01.tmp'; // file_01.tmp is dump file, can be anything
    return new File(filePath).writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
  }

  Future<int> deleteFile() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      var filePath = tempPath + '/file_01.tmp';
      File(filePath).delete();
    } catch (e) {
      return 0;
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
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: SingleChildScrollView(
            child: new Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: new Container(
                      margin: const EdgeInsets.only(top: 5, right: 10),
                      padding: const EdgeInsets.all(3.0),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          '''We have sent an OTP to ''',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: displayWidth(context) * 0.07,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: new Container(
                      margin: const EdgeInsets.only(top: 5, right: 10),
                      padding: const EdgeInsets.all(3.0),
                      child: Opacity(
                        opacity: 0.6,
                        child: Text(
                          '''Customer's Mobile''',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: displayWidth(context) * 0.07,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                  SizedBox(height: 10.0),
                  Center(
                      child: InkWell(
                    onTap: () {
                      //deliverNowotp();
                    },
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'RobotoBold',
                        fontSize: displayWidth(context) * 0.05,
                      ),
                    ),
                  )),
                  Center(
                    child: new Container(
                      margin: const EdgeInsets.only(top: 5, right: 10),
                      padding: const EdgeInsets.all(3.0),
                      child: Opacity(
                        opacity: 0.7,
                        child: Text(
                          '''Customer Signature''',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: displayWidth(context) * 0.07,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        height: 300.0,
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200], //Color(0xFFE4EDEF),
                        ),
                        child: Container(
                            child: SfSignaturePad(
                                key: signatureGlobalKey,
                                backgroundColor: Colors.white,
                                strokeColor: Colors.black,
                                minimumStrokeWidth: 1.0,
                                maximumStrokeWidth: 4.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)))),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        onPressed: () {
                          _handleClearButtonPressed();
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text(
                          "Clear",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      _handleSaveButtonPressed();
                      _onDone();
                      //Navigator.push(context, SlideLeftRoute(page: Takeorder2()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF2BCDB4),
                        //border: Border.all(color: Colors.blueAccent),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: 'RobotoBold',
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    child: uploadFile == null
                        ? Text("null hai")
                        : Image.file(
                            uploadFile,
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Container(
                    child: _sign == null ? Text("null hai") : _sign,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _onDone() async {
    String code = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _fourthController.text +
        _fifthController.text +
        _sixthController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString("token");
    print(token);
    Dio dio = new Dio();

    FormData data = FormData.fromMap({
      "sign": await MultipartFile.fromFile(
        uploadFile.path,
        filename: uploadFile.path.split('/').last,
      ),
    });

    dio.options.headers["Authorization"] = token;
    dio.options.headers["phn_number"] = widget.customer_phnnumber;
    dio.options.headers["otp"] = code;
    dio.options.headers["order_id"] = widget.orderId;
    dio.options.headers["branch"] = widget.orderType;

    dio
        .post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/delivered_otp.php',
      data: data,
    )
        .then((response) {
      var jsonResponse = jsonDecode(response.toString());
      if (jsonResponse['status'] == 200) {
        //Utility.saveImageToPreferences("cancel_cheque_image",
        //  Utility.base64String(_selectedFile.readAsBytesSync()));
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
    }).catchError((error) => print(error));
  }

  Future<http.Response> deliverNowotp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");

    Map data = {};
    var body = json.encode(data);

    http.Response res = await http.post(
      'https://www.mitrahtechnology.in/apis/mitrah-api/deliveryboy/delivered_otp.php',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": token,
        "phn_number": widget.customer_phnnumber,
      },
    );

    print(res.body);
    var responseData = json.decode(res.body);
    if (responseData['status'] == 200) {}
    return res;
  }
}

class DateUtil {
  String signformattedDate() {
    DateTime now = new DateTime.now();

    return now.toString();
  }
}
