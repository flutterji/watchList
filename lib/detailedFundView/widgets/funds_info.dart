import 'dart:math';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FundsInfo extends StatelessWidget {
  String fundName;
   FundsInfo({super.key , required this.fundName});
     var rng = Random();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 45.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BouncingWidget(
              duration: Duration(milliseconds: 100),
              scaleFactor: 1.5,

              onPressed: () {
                EasyDebounce.debounce(
                  '', // <-- An ID for this particular debouncer
                  Duration(milliseconds: 500), // <-- The debounce duration
                  () => Navigator.pop(context), // <-- The target method
                );
              },

              child: Icon(Icons.arrow_back, color: blueColor, size: 25.sp),
            ),
            BouncingWidget(
              duration: Duration(milliseconds: 100),
              scaleFactor: 1.5,

              onPressed: () {
                
              },

              child: Icon(
                Icons.bookmark_add_outlined,
                color: whiteColor,
                size: 25.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Text(
          fundName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: whiteColor,
            fontSize: 25.sp,
          ),
        ),

        SizedBox(height: 15.h),
        Row(
          children: [
            Text(
              nav,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: whiteColor.withValues(alpha: 0.5),
                fontSize: 17.5.sp,
              ),
            ),
            Text(
          ' ${rng.nextInt(99)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: whiteColor,
                fontSize: 17.5.sp,
              ),
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: 25.h),
          padding: EdgeInsets.all(15.w.h),
          decoration: BoxDecoration(
            border: Border.all(color: whiteColor.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    invested,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 15.5.sp,
                      color: whiteColor.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                  '$rupee ${rng.nextInt(99)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 17.5.sp,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              Container(
                height: 50.h,
                width: 2.w,
                color: whiteColor.withValues(alpha: 0.5),
                margin: EdgeInsets.symmetric(horizontal: 15.w),
              ),
              Column(
                children: [
                  Text(
                    currentValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 15.5.sp,
                      color: whiteColor.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '$rupee ${rng.nextInt(99)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 17.5.sp,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              Container(
                height: 50.h,
                width: 2.w,
                color: whiteColor.withValues(alpha: 0.5),
                margin: EdgeInsets.symmetric(horizontal: 15.w),
              ),
              Column(
                children: [
                  Text(
                    totalGain,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 15.5.sp,
                      color: whiteColor.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '$rupee ${rng.nextInt(99)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 17.5.sp,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
