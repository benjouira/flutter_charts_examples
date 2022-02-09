import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<_SalesData> data = [
  //   _SalesData('Jan', 35, 5),
  //   _SalesData('Feb', 28, 2),
  //   _SalesData('Mar', 19, 10),
  //   _SalesData('Apr', 32, 20),
  //   _SalesData('May', 40, 3)
  // ];
  List<_SalesData> data = [
    _SalesData(2010, 1, 35, 10),
    _SalesData(2011, 2, 28, 16),
    _SalesData(2012, 3, 19, 6),
    _SalesData(2013, 4, 32, 23),
    _SalesData(2014, 5, 40, 27)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My first Flutter chart example'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'This is a chart title'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip

              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, num>>[
                LineSeries<_SalesData, num>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    width: 2,
                    name: 'Sales',
                    markerSettings: const MarkerSettings(isVisible: true),
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
                LineSeries<_SalesData, num>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.qte,
                    width: 2,
                    name: 'quantity',
                    markerSettings: const MarkerSettings(isVisible: true),
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
                // LineSeries<_SalesData, num>(
                //     dataSource: data,
                //     xValueMapper: (_SalesData sales, _) => sales.month,
                //     yValueMapper: (_SalesData sales, _) => sales.qte,
                //     width: 2,
                //     name: 'quantity',
                //     markerSettings: const MarkerSettings(isVisible: true),
                //     // Enable data label
                //     dataLabelSettings: DataLabelSettings(isVisible: true)),
              ]),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     //Initialize the spark charts widget
          //     child: SfSparkLineChart.custom(
          //       //Enable the trackball
          //       trackball: SparkChartTrackball(
          //           activationMode: SparkChartActivationMode.tap),
          //       //Enable marker
          //       marker: SparkChartMarker(
          //           displayMode: SparkChartMarkerDisplayMode.all),
          //       //Enable data label
          //       labelDisplayMode: SparkChartLabelDisplayMode.all,
          //       xValueMapper: (int index) => data[index].year,
          //       yValueMapper: (int index) => data[index].sales,
          //       dataCount: 5,
          //     ),
          //   ),
          // )
        ]));
  }
}

class _SalesData {
  // _SalesData(this.year, this.sales, this.qte);
  _SalesData(this.year, this.month, this.sales, this.qte);

  final double month;
  final double year;
  final double sales;
  final double qte;
}
