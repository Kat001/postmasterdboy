import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postmasterdboy/Components/customicons.dart';
import 'package:sizer/sizer.dart';
import 'package:postmasterdboy/Components/animate.dart';
import 'package:share/share.dart';
//import 'package:social_share/social_share.dart';

class Refer extends StatefulWidget {
  @override
  _ReferState createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Image(
              image: AssetImage('assets/images/refer.png'),
              height: 30.0.h,
              width: 15.0.w,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0.h, left: 8.0.w, right: 8.0.w),
            width: 120.0.w,
            height: 10.0.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFE4EDEF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF0F0F0),
                    blurRadius: 5.0,
                    spreadRadius: 5.0,
                  ),
                ]),
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(
                      giftpic,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0.w),
                    child: Text(
                      "Refer friends to earn money",
                      style: TextStyle(
                          fontSize: 12.0.sp,
                          fontFamily: 'RobotoBold',
                          color: Color(0xFF465A64)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Share.share("Invite friend");
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0.w),
                      child: Text(
                        "Invite",
                        style: TextStyle(
                            fontSize: 13.0.sp,
                            fontFamily: 'RobotoBold',
                            color: Color(0xFF2BCDB4)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3.0.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0.w),
                  child: Text(
                    "Referral code - 70078",
                    style: TextStyle(
                        fontFamily: "RobotoBold",
                        fontSize: 15.0.sp,
                        color: Color(0xFF465A64)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3.0.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0.w),
                  child: Text(
                    "Share your referral Code",
                    style: TextStyle(
                        fontFamily: "RobotoBold",
                        fontSize: 15.0.sp,
                        color: Color(0xFF465A64)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3.0.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0.w),
                  child: Text(
                    "Your friend register with us",
                    style: TextStyle(
                        fontFamily: "RobotoBold",
                        fontSize: 15.0.sp,
                        color: Color(0xFF465A64)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3.0.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Icon(
                    Icons.arrow_right,
                    size: 50,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5.0.w),
                  child: Text(
                    "Your both get 200 Rs",
                    style: TextStyle(
                        fontFamily: "RobotoBold",
                        fontSize: 15.0.sp,
                        color: Color(0xFF465A64)),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Share.share("Invite friend");
            },
            child: Container(
              margin: EdgeInsets.only(left: 5.0.w, top: 4.0.h),
              child: Container(
                margin: EdgeInsets.only(left: 5.0.w, right: 10.0.w),
                width: 35.0.w,
                height: 7.0.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFE4EDEF),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFF0F0F0),
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                      ),
                    ]),
                child: Center(
                  child: Container(
                    //margin: EdgeInsets.only(left: 5.0.w),
                    child: Text(
                      "Invite",
                      style: TextStyle(
                          fontSize: 12.0.sp,
                          fontFamily: 'RobotoBold',
                          color: Color(0xFF465A64)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
