import 'package:flutter/material.dart';
import 'package:postmasterdboy/Components/sizes_helpers.dart';
import 'package:postmasterdboy/screens/halfyearly.dart';
import 'package:postmasterdboy/screens/monthly.dart';
import 'package:postmasterdboy/screens/quarterly.dart';
import 'package:postmasterdboy/screens/today.dart';
import 'package:postmasterdboy/screens/week.dart';
import 'package:postmasterdboy/screens/yearly.dart';

class Estimate extends StatefulWidget {
  @override
  _EstimateState createState() => _EstimateState();
}

class _EstimateState extends State<Estimate> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              bottom: PreferredSize(
                  child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.green[400],
                      indicator: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      unselectedLabelColor: Color(0xFF465A64),
                      tabs: [
                        Tab(
                          child: Text(
                            "TODAY ",
                            style: TextStyle(
                                color: Color(0xFF465A64),
                                fontFamily: "RobotoBold",
                                fontSize: displayWidth(context) * 0.04),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "WEEK ",
                            style: TextStyle(
                                color: Color(0xFF465A64),
                                fontFamily: "RobotoBold",
                                fontSize: displayWidth(context) * 0.04),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "MONTHLY ",
                            style: TextStyle(
                                color: Color(0xFF465A64),
                                fontFamily: "RobotoBold",
                                fontSize: displayWidth(context) * 0.04),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "QUARTERLY ",
                            style: TextStyle(
                                color: Color(0xFF465A64),
                                fontFamily: "RobotoBold",
                                fontSize: displayWidth(context) * 0.04),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "HALF YEARLY ",
                            style: TextStyle(
                                color: Color(0xFF465A64),
                                fontFamily: "RobotoBold",
                                fontSize: displayWidth(context) * 0.04),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "YEARLY ",
                            style: TextStyle(
                                color: Color(0xFF465A64),
                                fontFamily: "RobotoBold",
                                fontSize: displayWidth(context) * 0.04),
                          ),
                        ),
                      ]),
                  preferredSize: Size.fromHeight(30.0)),
            ),
            body: TabBarView(children: [
              Container(
                child: Today(),
                //ActiveOrders(),
              ),
              Container(
                child: Week(),
                //ActiveOrders(),
              ),
              Container(
                child: Month(),
                //ActiveOrders(),
              ),
              Container(
                child: Quarter(),
                //ActiveOrders(),
              ),
              Container(
                child: Halfyear(),
                //ActiveOrders(),
              ),
              Container(
                child: Year(),
                //ActiveOrders(),
              ),
            ])),
      ),
    );
  }
}

/* 

bottom: TabBar(
                onTap: (index) {},
                indicatorColor: Colors.green[400],
                indicator: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(15),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "AVAILABLE ",
                      style: TextStyle(
                          color: Color(0xFF465A64),
                          fontFamily: "RobotoBold",
                          fontSize: displayWidth(context) * 0.04),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "ACTIVE",
                      style: TextStyle(
                          color: Color(0xFF465A64),
                          fontFamily: "RobotoBold",
                          fontSize: displayWidth(context) * 0.04),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "COMPLETED",
                      style: TextStyle(
                          color: Color(0xFF465A64),
                          fontFamily: "RobotoBold",
                          fontSize: displayWidth(context) * 0.04),
                    ),
                  ),
                ],
              ),

 */
