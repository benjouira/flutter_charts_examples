import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'lineChart.dart' as lineChartPage;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          Container(
              child: SfCartesianChart(series: <ChartSeries>[
            // Renders bar chart
            BarSeries<_SalesData, double>(
                dataSource: data,
                isTrackVisible: true,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                borderRadius: BorderRadius.all(Radius.circular(30)))
          ])),
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
                    MaterialPageRoute(
                        builder: (context) => const lineChartPage.MyHomePage(
                              title: 'test',
                            )),
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
