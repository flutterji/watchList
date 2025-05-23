import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';




class BarGraph extends StatelessWidget {
  final List<_ChartData> chartData = [
    _ChartData('2023', 30, 20),
    _ChartData('2024', 40, 30),
    _ChartData('2025', 20, 25),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        isVisible: true,
        labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: whiteColor,
              fontSize: 16.sp,
            ),
                majorTickLines: MajorTickLines(width: 0),
        majorGridLines: MajorGridLines(width: 0),


      ),
    
      primaryYAxis: NumericAxis(
        isVisible: false,                      
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(width: 0),
          
      ),
    
      series: <CartesianSeries<_ChartData, String>>[
        StackedColumnSeries<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData data, _) => data.month,
          yValueMapper: (_ChartData data, _) => data.sales1,
          
        ),
        StackedColumnSeries<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData data, _) => data.month,
          yValueMapper: (_ChartData data, _) => data.sales2,
        ),
      ],
    );
  }
}

class _ChartData {
  final String month;
  final double sales1;
  final double sales2;

  _ChartData(this.month, this.sales1, this.sales2);
}