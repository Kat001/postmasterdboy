import 'package:flutter/material.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Container(
          margin: const EdgeInsets.only(top: 5, right: 10),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFF0F0F0),
                  blurRadius: 5.0,
                  spreadRadius: 5.0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 100, top: 20.0, left: 30.0),
                child: Row(
                  children: [
                    Text(
                      "Delivery amount",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoBold',
                        fontSize: displayWidth(context) * 0.05,
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cash",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontSize: displayWidth(context) * 0.05,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Cashlash",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'RobotoBold',
                            fontSize: displayWidth(context) * 0.05,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
