import 'dart:math';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineGraph extends StatefulWidget {
   SplineGraph({super.key});

  @override
  State<SplineGraph> createState() => _SplineGraphState();
}

class _SplineGraphState extends State<SplineGraph> {
  late TrackballBehavior _trackballBehavior;
 

  List<_SalesData> data = [
    _SalesData('2021', double.parse( "${Random().nextInt(99)}")),
    _SalesData('2022', double.parse( "${Random().nextInt(99)}")),
    _SalesData('2023', double.parse( "${Random().nextInt(99)}")),
    _SalesData('2024', double.parse( "${Random().nextInt(99)}")),
    _SalesData('2025', double.parse( "${Random().nextInt(99)}")),
  ];

  @override
  void initState() {
    super.initState();
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: InteractiveTooltip(
        enable: true,
        color: blueColor,
        textStyle: TextStyle(color: whiteColor),
      ),
      builder: (context, trackballDetails) {
        return Container(
          height: 60.h,
          width: 160.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            border: Border.all(width: 2, color: blueColor),

            color: blueColor.withValues(alpha: 0.2),
          ),

          padding: const EdgeInsets.all(10),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                height: 2.5.h,
                width: 15.w,
                color: whiteColor,
                
              ),
              SizedBox(width: 5.w,),
              Text(
                "$nav : $rupee ${data[trackballDetails.pointIndex!].sales.toString().substring(0,2)}",

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        );
      },
      lineType: TrackballLineType.vertical,
      lineColor: blueColor,
      lineWidth: 2,
      hideDelay: 3000,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  SfCartesianChart(
      trackballBehavior: _trackballBehavior,
        
      plotAreaBorderWidth: 0,
        
      primaryXAxis: CategoryAxis(
          labelPlacement: LabelPlacement.onTicks,

        majorGridLines: MajorGridLines(width: 0),
        labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: whiteColor,
              fontSize: 16.sp,
            ),
        majorTickLines: const MajorTickLines(width: 0, size: 0),
      ),
      primaryYAxis: CategoryAxis(
        isVisible: false,
        
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(width: 0),
      ),
      series: <CartesianSeries<_SalesData, String>>[
        SplineAreaSeries<_SalesData, String>(
          borderColor: blueColor,
          dataSource: data,
          color: blueColor.withValues(alpha: 0.2),
          borderWidth: 5.w,
          xValueMapper: (_SalesData sales, _) => sales.year,
        
          yValueMapper: (_SalesData sales, _) => sales.sales,
        
          dataLabelSettings: DataLabelSettings(isVisible: false),
        ),
      ],
    );
  }
}


class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
