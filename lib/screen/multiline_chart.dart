import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class MultilineCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: customChart(context),
    );
  }

  Widget customChart(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width * 0.9,
        child: BezierChart(
            bezierChartScale: BezierChartScale.CUSTOM,
            xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
            bubbleLabelValueBuilder: (double value) {
              return getLableBuilder(value);
            },
            // build to show x axis value

            series: const [
              BezierLine(
                label: "Chart custom",
                lineColor: Colors.orange,
                lineStrokeWidth: 5,
                dataPointFillColor: Colors.white,
                dataPointStrokeColor: Colors.black,
                data: const [
                  DataPoint<double>(value: 10, xAxis: 0),
                  DataPoint<double>(value: 130, xAxis: 5),
                  DataPoint<double>(value: 50, xAxis: 10),
                  DataPoint<double>(value: 150, xAxis: 15),
                  DataPoint<double>(value: 75, xAxis: 20),
                  DataPoint<double>(value: 0, xAxis: 25),
                  DataPoint<double>(value: 5, xAxis: 30),
                  DataPoint<double>(value: 45, xAxis: 35),
                ],
              ),
              BezierLine(
                label: "line 2 ",
                lineColor: Colors.blue,
                lineStrokeWidth: 5,
                dataPointFillColor: Colors.white,
                dataPointStrokeColor: Colors.black,
                data: const [
                  DataPoint<double>(value: 100, xAxis: 0),
                  DataPoint<double>(value: 10, xAxis: 5),
                  DataPoint<double>(value: 60, xAxis: 10),
                  DataPoint<double>(value: 70, xAxis: 15),
                  DataPoint<double>(value: 20, xAxis: 20),
                  DataPoint<double>(value: 10, xAxis: 25),
                  DataPoint<double>(value: 50, xAxis: 30),
                  DataPoint<double>(value: 20, xAxis: 35),
                ],
              ),
              BezierLine(
                label: "line 3 ",
                lineColor: Colors.black,
                lineStrokeWidth: 5,
                dataPointFillColor: Colors.white,
                dataPointStrokeColor: Colors.black,
                data: const [
                  DataPoint<double>(value: 150, xAxis: 0),
                  DataPoint<double>(value: 30, xAxis: 5),
                  DataPoint<double>(value: 50, xAxis: 10),
                  DataPoint<double>(value: 90, xAxis: 15),
                  DataPoint<double>(value: 70, xAxis: 20),
                  DataPoint<double>(value: 5, xAxis: 25),
                  DataPoint<double>(value: 0, xAxis: 30),
                  DataPoint<double>(value: 90, xAxis: 35),
                ],
              ),
            ],
            config: BezierChartConfig(
              verticalIndicatorStrokeWidth: 3.0,
              verticalIndicatorColor: Colors.black26,
              showVerticalIndicator: true,
              backgroundColor: Colors.green,
              bubbleIndicatorColor: Colors.red,
              displayLinesXAxis: true,
              xLinesColor: Colors.red,
              footerHeight: 100,
              verticalLineFullHeight: true,
//  displayYAxis: true,
              bubbleIndicatorTitleStyle: TextStyle(color: Colors.black38),
              showDataPoints: true,
              snap: false,
              pinchZoom: true,
// bubbleIndicatorValueFormat:NumberFormat.percentPattern()
            )),
      ),
    );
  }

  String getLableBuilder(double value) {
    return "$value";
  }
}
