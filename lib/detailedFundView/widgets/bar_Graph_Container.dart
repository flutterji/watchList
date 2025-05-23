import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_application_1/detailedFundView/widgets/bar_Graph.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarGraphContainer extends StatefulWidget {
  BarGraphContainer({super.key});

  @override
  State<BarGraphContainer> createState() => _BarGraphContainerState();
}

class _BarGraphContainerState extends State<BarGraphContainer> {
  TextEditingController investedAmountController = TextEditingController(
    text: '1',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h, bottom: 10.h),
          padding: EdgeInsets.all(10.h.w),
          decoration: BoxDecoration(
            color: whiteColor.withValues(alpha: 0.1),
            border: Border.all(color: whiteColor, width: 0.5),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        ifYouInvested,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        width: 55.w,
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: investedAmountController,
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          onFieldSubmitted: (value) {
                            if (int.parse(investedAmountController.text) > 10) {
                              investedAmountController.text = '10';
                            } else if (int.parse(
                                  investedAmountController.text,
                                ) ==
                                0) {
                              investedAmountController.text = '1';
                            }
                            setState(() {});
                          },

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: whiteColor,
                            fontSize: 15.sp,
                          ),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: '',
                            prefix: Text(
                              '$rupee ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                                fontSize: 15.sp,
                              ),
                            ),
                            suffix: Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Icon(
                                Icons.edit,
                                color: whiteColor,
                                size: 12.5.sp,
                              ),
                            ),
                            isDense: true,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteColor),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    padding: EdgeInsets.all(2.5.w.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 5.h,
                      ),

                      color: blueColor,
                      child: Text(
                        oneTime,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),
              SliderTheme(
                data: SliderThemeData(
                  padding: EdgeInsets.only(left: 2.5.w, right: 10.w),
                  activeTrackColor: blueColor,
                  inactiveTrackColor: blueColor.withValues(alpha: 0.5),
                  trackHeight: 2.5.h,
                ),
                child: Slider(
                  value: double.parse(investedAmountController.text),
                  onChanged: (val) {
                    setState(() {
                      investedAmountController.text = val.toString().split(
                        '.',
                      )[0];
                    });
                  },
                  min: 1,
                  max: 10,
                  activeColor: blueColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$rupee 1L',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    '$rupee 10L',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    thisFundsPastReturns,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    '$rupee ${Random().nextInt(99)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    profitPercentage,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor.withValues(alpha: 0.5),
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    '${Random().nextInt(99)} %',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              SizedBox(
                height: 350.h,
                child: BarGraph())
            ],
          ),
        ),
      ],
    );
  }
}
