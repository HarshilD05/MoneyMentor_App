import 'dart:convert';

class HistDataPoint {
  // final double adjClose;
  final double close;
  final String date;
  final double high;
  final double low;
  final double open;
  final int volume;

  HistDataPoint({
    // this.adjClose = 0.0,
    this.close = 0.0,
    this.date = "",
    this.high = 0.0,
    this.low = 0.0,
    this.open = 0.0,
    this.volume = 0,
  });

  factory HistDataPoint.fromJson(Map<String, dynamic> json) => HistDataPoint(
        // adjClose: json["Adj Close"]?.toDouble(),
        close: json["Close"]?.toDouble(),
        date: json["Date"],
        high: json["High"]?.toDouble(),
        low: json["Low"]?.toDouble(),
        open: json["Open"].toDouble(),
        volume: json["Volume"],
      );

  Map<String, dynamic> toJson() => {
        // "Adj Close": adjClose,
        "Close": close,
        "Date": date,
        "High": high,
        "Low": low,
        "Open": open,
        "Volume": volume,
      };
}



HistoricalData historicalDataFromJson(String str) => HistoricalData.fromJson(json.decode(str));

String historicalDataToJson(HistoricalData data) => json.encode(data.toJson());

class HistoricalData {
    final List<HistDataPoint> historicalData;

    HistoricalData({
        required this.historicalData,
    });

    factory HistoricalData.fromJson(Map<String, dynamic> json) => HistoricalData(
        historicalData: List<HistDataPoint>.from(json["historicalData"].map((x) => HistDataPoint.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "historicalData": List<dynamic>.from(historicalData.map((x) => x.toJson())),
    };
}