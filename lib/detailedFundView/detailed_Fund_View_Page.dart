import 'dart:math';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_application_1/detailedFundView/widgets/bar_Graph.dart';
import 'package:flutter_application_1/detailedFundView/widgets/bar_Graph_Container.dart';
import 'package:flutter_application_1/detailedFundView/widgets/funds_info.dart';
import 'package:flutter_application_1/detailedFundView/widgets/spline_Graph.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailedFundViewPage extends StatefulWidget {
  String fundName;

  DetailedFundViewPage({super.key ,required this.fundName});

  @override
  State<DetailedFundViewPage> createState() => _DetailedFundViewPageState();
}

class _DetailedFundViewPageState extends State<DetailedFundViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        FundsInfo(fundName: widget.fundName,),
        
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
        
                children: [
                  Row(
                    children: [Container(
                    height: 2.5.h,
                    width: 15.w,
                    color: whiteColor.withValues(alpha: 0.5),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                  ),
                  Text(
                    "$nav : $rupee ${Random().nextInt(99)}",
        
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 13.sp,
                    ),
                  ),],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:  15.w , vertical: 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: blueColor),
                      borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Text(
                    nav,
        
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 13.sp,
                    ),
                  ),
                  )
                  
                ],
              ),
              SplineGraph(),
              BarGraphContainer()
        
              
        
        
            ],
          ),
        ),
      ),
    );
  }
}
