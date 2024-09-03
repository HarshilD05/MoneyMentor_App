import 'package:moneymentor/models/historical_data_model.dart';
import 'package:moneymentor/models/predictions_model.dart';
import 'dart:convert';

List<StockData> stockDataFromJson(String str) =>
    List<StockData>.from(json.decode(str).map((x) => StockData.fromJson(x)));

String stockDataToJson(List<StockData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockData {
  final double currPrice;
  final List<HistDataPoint> historicalData;
  final String iconUrl;
  final String lastDataUpdateDate;
  final String lastPredictionsUpdateDate;
  final double percentGrowth;
  final Predictions predictions;
  final String stockName;
  final String ticker;
  final String description;

  StockData({
    required this.currPrice,
    required this.historicalData,
    required this.iconUrl,
    required this.lastDataUpdateDate,
    required this.lastPredictionsUpdateDate,
    required this.percentGrowth,
    required this.predictions,
    required this.stockName,
    required this.ticker,
    required this.description,
  });

  factory StockData.fromJson(Map<String, dynamic> json) => StockData(
        currPrice: json["currPrice"]?.toDouble(),
        historicalData: List<HistDataPoint>.from(json["historicalData"].map(
            (x) => (x == null) ? HistDataPoint() : HistDataPoint.fromJson(x))),
        iconUrl: json["iconURL"],
        lastDataUpdateDate: json["lastDataUpdateDate"],
        lastPredictionsUpdateDate: json["lastPredictionsUpdateDate"],
        percentGrowth: json["percentGrowth"]?.toDouble(),
        predictions: Predictions.fromJson(json["predictions"]),
        stockName: json["stockName"],
        ticker: json["ticker"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "currPrice": currPrice,
        "historicalData":
            List<dynamic>.from(historicalData.map((x) => x.toJson())),
        "iconURL": iconUrl,
        "lastDataUpdateDate": lastDataUpdateDate,
        "lastPredictionsUpdateDate": lastPredictionsUpdateDate,
        "percentGrowth": percentGrowth,
        "predictions": predictions.toJson(),
        "stockName": stockName,
        "ticker": ticker,
        "description": description,
      };
}











// class StockData {
//     final double currPrice;
//     final HistoricalData historicalData;
//     final String iconUrl;
//     final DateTime lastDataUpdateDate;
//     final DateTime lastPredictionsUpdateDate;
//     final double percentGrowth;
//     final Predictions predictions;
//     final String stockName;
//     final String ticker;

//     StockData({
//         required this.currPrice,
//         required this.historicalData,
//         required this.iconUrl,
//         required this.lastDataUpdateDate,
//         required this.lastPredictionsUpdateDate,
//         required this.percentGrowth,
//         required this.predictions,
//         required this.stockName,
//         required this.ticker,
//     });

//     factory StockData.fromJson(Map<String, dynamic> json) => StockData(
//         currPrice: json["currPrice"]?.toDouble(),
//         historicalData: HistoricalData.fromJson(json["historicalData"]),
//         iconUrl: json["iconURL"],
//         lastDataUpdateDate: DateTime.parse(json["lastDataUpdateDate"]),
//         lastPredictionsUpdateDate: DateTime.parse(json["lastPredictionsUpdateDate"]),
//         percentGrowth: json["percentGrowth"]?.toDouble(),
//         predictions: Predictions.fromJson(json["predictions"]),
//         stockName: json["stockName"],
//         ticker: json["ticker"],
//     );

//     Map<String, dynamic> toJson() => {
//         "currPrice": currPrice,
//         "historicalData": historicalData.toJson(),
//         "iconURL": iconUrl,
//         "lastDataUpdateDate": "${lastDataUpdateDate.year.toString().padLeft(4, '0')}-${lastDataUpdateDate.month.toString().padLeft(2, '0')}-${lastDataUpdateDate.day.toString().padLeft(2, '0')}",
//         "lastPredictionsUpdateDate": "${lastPredictionsUpdateDate.year.toString().padLeft(4, '0')}-${lastPredictionsUpdateDate.month.toString().padLeft(2, '0')}-${lastPredictionsUpdateDate.day.toString().padLeft(2, '0')}",
//         "percentGrowth": percentGrowth,
//         "predictions": predictions.toJson(),
//         "stockName": stockName,
//         "ticker": ticker,
//     };
// }