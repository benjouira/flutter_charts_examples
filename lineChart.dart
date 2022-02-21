import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'bubbleChart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
          Row(
            children: [
              ElevatedButton(
                child: const Text('back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BubbleChart()),
                  );
                },
              ),
            ],
          )
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
