import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
  String x_axis_format( DateTime value,  BezierChartScale scaleType) {
    return "${value.month}";
}
Widget monthlyChart(BuildContext context) {
  final fromDate = DateTime(2018, 11, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  final date3 = DateTime.now().subtract(Duration(days: 35));
  final date4 = DateTime.now().subtract(Duration(days: 36));

  final date5 = DateTime.now().subtract(Duration(days: 65));
  final date6 = DateTime.now().subtract(Duration(days: 64));

  return Center(
    child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(
        bezierChartScale: BezierChartScale.MONTHLY,
        fromDate: fromDate,
        toDate: toDate,
        selectedDate: toDate,
        footerDateTimeBuilder: (value, scaleType) {
          return  x_axis_format(value,  scaleType);
        },
        series: [
          BezierLine(
            dataPointStrokeColor: Colors.blue,
            lineColor: Colors.green,
            label: "Duty",
            onMissingValue: (dateTime) {
              if (dateTime.month.isEven) {
                return 60.0;
              }
              return 30.0;
            },
            data: [
              DataPoint<DateTime>(value: 3, xAxis: date1),
              DataPoint<DateTime>(value: 100, xAxis: date2),
              DataPoint<DateTime>(value: 10, xAxis: date3),
              DataPoint<DateTime>(value: 60, xAxis: date4),
              DataPoint<DateTime>(value: 80, xAxis: date5),
              DataPoint<DateTime>(value: 40, xAxis: date6),
            ],
          ),

        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black26,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          backgroundColor: Colors.grey,
          footerHeight: 30.0,
          backgroundGradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.pink
            ],
          ),
          pinchZoom: true
        ),
      ),
    ),
  );
}
