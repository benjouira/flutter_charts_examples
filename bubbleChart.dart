import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'columnChart.dart';

class BubbleChart extends StatefulWidget {
  BubbleChart({Key? key}) : super(key: key);

  @override
  State<BubbleChart> createState() => _BubbleChartState();
}

class _BubbleChartState extends State<BubbleChart> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(DateTime(2010), 35, 0.32),
      ChartData(DateTime(2011), 38, 0.21),
      ChartData(DateTime(2012), 34, 0.98),
      ChartData(DateTime(2013), 52, 0.29),
      ChartData(DateTime(2014), 40, 0.34)
    ];
    final List<Color> color = <Color>[];
    color.add(Colors.green[50]!);
    color.add(Colors.green[200]!);
    color.add(Colors.green);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Scaffold(
        body: Column(children: [
      Container(
          padding: EdgeInsets.only(top: 50, bottom: 20, right: 10),
          child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              tooltipBehavior: _tooltipBehavior,
              annotations: <CartesianChartAnnotation>[
                CartesianChartAnnotation(
                  widget: Container(
                    child: const Text(
                      "text for test",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 80),
                    ),
                  ),
                  coordinateUnit: CoordinateUnit.point,
                  region: AnnotationRegion.chart,
                  x: DateTime(2012),
                  y: 34,
                )
              ],
              series: <ChartSeries>[
                // Renders bubble chart
                BubbleSeries<ChartData, DateTime>(
                  dataSource: chartData,
                  sizeValueMapper: (ChartData sales, _) => sales.size,
                  // ******************* options**************
                  minimumRadius: 9, // Minimum radius of bubble
                  maximumRadius: 35, // Maximum radius of bubble
                  gradient: gradientColors,
                  //Enables the tooltip for individual series
                  enableTooltip: true,
                  // ****************************************
                  xValueMapper: (ChartData sales, _) => sales.x,
                  yValueMapper: (ChartData sales, _) => sales.y,
                )
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
                    builder: (context) => const MyHomePage(
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

class ChartData {
  ChartData(this.x, this.y, this.size);
  final DateTime x;
  // final int x;
  final double y;
  final double size;
}
