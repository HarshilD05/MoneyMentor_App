import 'package:flutter/material.dart';
import 'package:moneymentor/harshil_widgets/candle_graph.dart';

import 'package:moneymentor/models/historical_data_model.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class DropDownPanel extends StatefulWidget {
  final List<HistDataPoint> historicalData;
  final String stockName;
  // List<double> dataPoints = [];

  const DropDownPanel({
    super.key,
    required this.historicalData,
    required this.stockName,
  });

  @override
  State<DropDownPanel> createState() => _DropDownPanelState();
}

class _DropDownPanelState extends State<DropDownPanel> {
  int idx = 0;
  final duration = ["3M", "6M", "1Y", "2Y", "5Y", "10Y", "MAX"];
  List<HistDataPoint> filteredData = [];

  List<HistDataPoint> filterDataByMonths(List<HistDataPoint> data, int months) {
    List<HistDataPoint> filteredData = [];
    // Parsing the current DateTime of data
    DateTime currentDate = DateTime.parse(data[data.length - 1].date);
    // Parsing the DateTime of the data after the specified months
    DateTime cutOffDate = currentDate.subtract(Duration(days: months * 30));
    // Filtering the data based on the cutOffDate
    for (int i = data.length - 1; i >= 0; i--) {
      DateTime date = DateTime.parse(data[i].date);
      if (date.isAfter(cutOffDate)) {
        filteredData.add(data[i]);
      } else {
        break;
      }
    }

    return filteredData.reversed.toList();
  }

  // Functionto Filter the data based on duration
  List<HistDataPoint> filterData(List<HistDataPoint> data, String duration) {
    List<HistDataPoint> filteredData = [];
    switch (duration) {
      case "3M":
        filteredData = filterDataByMonths(data, 3);
        break;
      case "6M":
        filteredData = filterDataByMonths(data, 6);
        break;
      case "1Y":
        filteredData = filterDataByMonths(data, 12);
        break;
      case "2Y":
        filteredData = filterDataByMonths(data, 24);
        break;
      case "5Y":
        filteredData = filterDataByMonths(data, 60);
        break;
      case "10Y":
        filteredData = filterDataByMonths(data, 120);
        break;
      case "MAX":
        filteredData = data;
        break;
    }

    return filteredData;
  }

  double getMinY(List<HistDataPoint> histData) {
    double min = histData[0].low;
    for (int i = 1; i < histData.length; i++) {
      if (histData[i].low < min) {
        min = histData[i].low;
      }
    }
    return (min - 10);
  }

  double getMaxY(List<HistDataPoint> histData) {
    double max = histData[0].high;
    for (int i = 1; i < histData.length; i++) {
      if (histData[i].high > max) {
        max = histData[i].high;
      }
    }
    return (max + 10);
  }

  @override
  Widget build(BuildContext context) {
    filteredData = filterData(widget.historicalData, duration[idx]);
    double minY = getMinY(filteredData);
    double maxY = getMaxY(filteredData);

    bool isGrowing =
        filteredData[0].close < filteredData[filteredData.length - 1].close;

    double valueIncrease =
        (filteredData[filteredData.length - 1].close - filteredData[0].close);
    final bool dark = THelperFunctions.isDarkMode(context);
    return Container(
        color: dark ? Colors.black : Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
              width: 200,
              height: 150,
              child: CandleGraph(
                  title: widget.stockName,
                  historicalData: filteredData,
                  minY: minY,
                  maxY: maxY)),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (idx > 0) {
                        idx = idx - 1;
                      } else {
                        idx = duration.length - 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.arrow_left),
                  iconSize: 32,
                ),
                Text(
                  duration[idx],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (idx < duration.length - 1) {
                          idx = idx + 1;
                        } else {
                          idx = 0;
                        }
                      });
                    },
                    icon: const Icon(Icons.arrow_right),
                    iconSize: 32)
              ]),
              Row(children: [
                (isGrowing)
                    ? const Icon(Icons.arrow_drop_up, color: Colors.green)
                    : const Icon(Icons.arrow_drop_down, color: Colors.red),
                Text(
                  valueIncrease.toStringAsFixed(2),
                  style: TextStyle(
                    color: (isGrowing) ? Colors.green : Colors.red,
                  ),
                ),
              ])
            ],
          ))
        ]));
  }
}
