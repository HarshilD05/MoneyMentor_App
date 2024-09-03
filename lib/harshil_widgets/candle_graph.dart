import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymentor/models/historical_data_model.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CandleGraph extends StatefulWidget {
  final String title;
  final List<HistDataPoint> historicalData;
  double minY;
  double maxY;

  CandleGraph({
    super.key,
    required this.title,
    required this.historicalData,
    this.minY = 0,
    this.maxY = 10000,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<CandleGraph> createState() => _CandleGraphState();
}

class _CandleGraphState extends State<CandleGraph> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCartesianChart(
      title: ChartTitle(text: widget.title),
      trackballBehavior: _trackballBehavior,
      series: <CandleSeries>[
        CandleSeries<HistDataPoint, int>(
          dataSource: widget.historicalData,
          xValueMapper: (HistDataPoint sales, _) =>
              widget.historicalData.indexOf(sales),
          lowValueMapper: (HistDataPoint sales, _) => sales.low,
          highValueMapper: (HistDataPoint sales, _) => sales.high,
          openValueMapper: (HistDataPoint sales, _) => sales.open,
          closeValueMapper: (HistDataPoint sales, _) => sales.close,
        )
      ],
      primaryXAxis: const NumericAxis(),
      primaryYAxis: NumericAxis(
          minimum: widget.minY,
          maximum: widget.maxY,
          interval: (widget.maxY - widget.minY) / 5,
          numberFormat: NumberFormat("$indianruppes####", "en_IN")),
    ));
  }
}
