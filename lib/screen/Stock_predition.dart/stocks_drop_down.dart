import 'package:flutter/material.dart';
import 'package:moneymentor/harshil_widgets/candle_graph.dart';
import 'package:moneymentor/models/historical_data_model.dart';
import 'package:moneymentor/models/stock_data_model.dart';
import 'package:moneymentor/utils/constants/fontstyles.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class OnClickScreen extends StatefulWidget {
  final StockData stockData;

  const OnClickScreen({super.key, required this.stockData});

  @override
  State<OnClickScreen> createState() => _OnClickScreenState();
}

class _OnClickScreenState extends State<OnClickScreen> {
  int idx = 0;
  final duration = ["3M", "6M", "1Y", "2Y", "5Y", "10Y", "MAX"];

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
    List<HistDataPoint> filteredData =
        filterData(widget.stockData.historicalData, duration[idx]);
    double minY = getMinY(filteredData);
    double maxY = getMaxY(filteredData);

    Color changeColor(value) => value > 0 ? Colors.green : Colors.red;

    final bool isDark = THelperFunctions.isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    height: 45,
                    width: 45,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        widget.stockData.iconUrl, // Replace with your image URL
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Text('Error loading image: $error');
                          //print("Error Loading the Image : $error");
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.stockData.stockName,
                              style: const TextStyle(
                                fontFamily: bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              widget.stockData.ticker,
                              style: const TextStyle(
                                fontFamily: regular,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    height: 250,
                    width: double.infinity,
                    child: CandleGraph(
                      title: widget.stockData.stockName,
                      historicalData: filteredData,
                      minY: minY,
                      maxY: maxY,
                    )),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
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
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.stockData.description,
                ),
              ),

              const SizedBox(
                height: 30,
                width: double.infinity,
              ),

              const Center(
                child: Text(
                  "Predictions Table",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),

              // Predictions Table
              Table(
                  border: TableBorder.all(
                      color: isDark ? Colors.white : Colors.black),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  defaultColumnWidth: const IntrinsicColumnWidth(),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Time Period',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Future Value',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                '% Growth',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('3M'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred3months
                                                .value >
                                            0
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred3months
                                        .value), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred3months.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred3months
                                          .value), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred3months
                                                .percentIncrease >
                                            0
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred3months
                                        .percentIncrease), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred3months.percentIncrease.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred3months
                                          .percentIncrease), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('6M'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred6months
                                                .value >
                                            0
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred6months
                                        .value), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred6months.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred6months
                                          .value), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred6months
                                                .percentIncrease >
                                            0
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred6months
                                        .percentIncrease), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred6months.percentIncrease.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred6months
                                          .percentIncrease), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('1Y'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred1year
                                                .value >
                                            0
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred1year
                                        .value), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred1year.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred1year
                                          .value), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred1year.percentIncrease >
                                            0
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred1year.percentIncrease), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred1year.percentIncrease.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred1year.percentIncrease), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('2Y'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred2years
                                                .value >
                                            0
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred2years
                                        .value), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred2years.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred2years
                                          .value), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred2years.percentIncrease> 0
                                          
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred2years.percentIncrease), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred2years.percentIncrease.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred2years.percentIncrease), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('3Y'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred3years
                                                .value >
                                            0
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred3years
                                        .value), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred3years.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred3years
                                          .value), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred3years.percentIncrease >
                                            0
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred3years.percentIncrease), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred3years.percentIncrease.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred3years
                                          .percentIncrease), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text('5Y'),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred5years
                                                .value >
                                            0
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred5years
                                        .value), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred5years.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred5years
                                          .value), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    widget.stockData.predictions.pred5years
                                                .percentIncrease >
                                            0
                                        ? Icons.trending_up
                                        : Icons.trending_down,
                                    size: 18.0,
                                    color: changeColor(widget
                                        .stockData
                                        .predictions
                                        .pred5years
                                        .percentIncrease), // Use the calculated color
                                  ),
                                  Text(
                                    "${widget.stockData.predictions.pred5years.percentIncrease.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: changeColor(widget
                                          .stockData
                                          .predictions
                                          .pred5years
                                          .percentIncrease), // Use the calculated color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])
            ]),
          ),
        ),
      ),
    );
  }
}
