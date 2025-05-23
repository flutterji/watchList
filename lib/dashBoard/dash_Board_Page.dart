import 'dart:convert';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_application_1/detailedFundView/detailed_Fund_View_Page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  var loadFundData;

  Future<List<dynamic>> loadFundDataMethod() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    return json.decode(jsonString);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFundData = loadFundDataMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Text(
            dashBoard,
            style: TextStyle(
              color: whiteColor,
              fontSize: 25.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 30.h),
      
          FutureBuilder<List<dynamic>>(
            future: loadFundData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '$Error ${snapshot.error}',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                );
              } else {
                final funds = snapshot.data!;
      
                return Expanded(
                  child: ListView.builder(
                    itemCount: funds.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          EasyDebounce.debounce(
                            '',
                            Duration(milliseconds: 250),
                            () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(seconds: 5),
                                  reverseDuration: Duration(seconds: 5),
                                  type: PageTransitionType.rightToLeft,
                                  child: DetailedFundViewPage(
                                    fundName: funds[i]['fund_Name'],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(20.h.w),
                          width: 50,
                          height: 100.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: whiteColor),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    funds[i]['fund_Name'],
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "$currentValue : $rupee${funds[i]['current_Value']}",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
