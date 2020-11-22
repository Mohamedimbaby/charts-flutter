import 'package:flutter/material.dart';
import 'package:flutterbezier/screen/weekly_chart.dart';
import 'package:flutterbezier/screen/yearly_chart.dart';

import 'Strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2.0),
          children: [
            cardView(title: "Custom Chart", image: Strings.CUSTOM_CHART),
            cardView(
                title: "Weekly Chart",
                image: Strings.WEEKLY_CHART,
                screen: WeeklyChart()),
            cardView(title: "Monthly Chart", image: Strings.MONTHLY_CHART),
            cardView(
                title: "Year Chart",
                image: Strings.YEARLY_CHART,
                screen: YearlyChart()),
            cardView(
                title: "Custom Numbers multiline",
                image: Strings.MULTILINE_CHART),
          ],
        ),
      ),
    );
  }

  Widget cardView({String title, String image, var screen}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        width: 200,
        height: 120,
        alignment: Alignment.center,
        child: ListView(
          children: [
            Image.asset(
              image,
              height: 60,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
