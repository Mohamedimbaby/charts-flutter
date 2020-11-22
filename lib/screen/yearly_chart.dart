import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class YearlyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: sample5(context),
    );
  }

  /// yearly chart get from & end Dates (Datetime)
  Widget sample5(BuildContext context) {
    final fromDate = DateTime(2018, 11, 22);
    final toDate = DateTime.now();

    final date1 = DateTime.now().subtract(Duration(days: 2));
    final date2 = DateTime.now().subtract(Duration(days: 3));

    final date3 = DateTime.now().subtract(Duration(days: 300));
    final date4 = DateTime.now().subtract(Duration(days: 320));

    final date5 = DateTime.now().subtract(Duration(days: 650));
    final date6 = DateTime.now().subtract(Duration(days: 652));

    return Center(
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          bezierChartScale: BezierChartScale.YEARLY,
          fromDate: fromDate,
          toDate: toDate,
          selectedDate: toDate,
          series: [
            /// BezierLine get datetime points (x-axis) & it's values (y-axis)
            BezierLine(
              label: "Duty",
              onMissingValue: (dateTime) {
                if (dateTime.year.isEven) {
                  return 20.0;
                }
                return 5.0;
              },
              data: [
                DataPoint<DateTime>(value: 10, xAxis: date1),
                DataPoint<DateTime>(value: 50, xAxis: date2),
                DataPoint<DateTime>(value: 100, xAxis: date3),
                DataPoint<DateTime>(value: 100, xAxis: date4),
                DataPoint<DateTime>(value: 40, xAxis: date5),
                DataPoint<DateTime>(value: 47, xAxis: date6),
              ],
            ),
            BezierLine(
              /// configuration of chart line
              label: "Flight",
              lineColor: Colors.black26,
              dataPointFillColor: Colors.teal,
              lineStrokeWidth: 18.0,
              dataPointStrokeColor: Colors.black,

              /// if not provide the value of date at specific point on x-axis
              // onMissingValue: (dateTime) {
              //   if (dateTime.month.isEven) {
              //     return 10.0;
              //   }
              //   return 3.0;
              // },
              data: [
                DataPoint<DateTime>(value: 20, xAxis: date1),
                DataPoint<DateTime>(value: 30, xAxis: date2),
                DataPoint<DateTime>(value: 150, xAxis: date3),
                DataPoint<DateTime>(value: 80, xAxis: date4),
                DataPoint<DateTime>(value: 45, xAxis: date5),
                DataPoint<DateTime>(value: 45, xAxis: date6),
              ],
            ),
          ],
          config: BezierChartConfig(

              /// configuration of vertical indicator on x-axis
              verticalIndicatorStrokeWidth: 3.0,
              verticalIndicatorColor: Colors.black26,
              showVerticalIndicator: true,
              verticalIndicatorFixedPosition: false,

              /// background color of chart
              backgroundGradient: LinearGradient(
                colors: [
                  Colors.red[300],
                  Colors.red[400],
                  Colors.red[400],
                  Colors.red[500],
                  Colors.red,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),

              /// space bottom to chart
              footerHeight: 50.0,

              /// show & configure y-axis
              displayYAxis: true,
              stepsYAxis: 50,

              /// [false] disable chart zooming
              pinchZoom: true,

              /// scroll with tooltip over the chart
              snap: false,

              /// showing notation for given points only
              displayDataPointWhenNoValue: false,

              /// [false] if you need to show only line without any points
              showDataPoints: true,

              /// background color of tooltip
              bubbleIndicatorColor: Colors.amberAccent,
              //labels of lines
              bubbleIndicatorLabelStyle:
                  TextStyle(fontSize: 22.0, color: Colors.white),
              //x-axis points in tooltip
              bubbleIndicatorTitleStyle: TextStyle(color: Colors.green),
              //values of each point in tooltip
              bubbleIndicatorValueStyle: TextStyle(color: Colors.deepPurple)),

          /// select on specific date
          onDateTimeSelected: (value) {
            print(value);
          },

          /// check if tooltip opened
          onIndicatorVisible: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
