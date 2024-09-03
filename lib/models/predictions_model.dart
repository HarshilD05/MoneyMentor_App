class PredictedValue {
  final double percentIncrease;
  final double value;

  PredictedValue({
    required this.percentIncrease,
    required this.value,
  });

  factory PredictedValue.fromJson(Map<String, dynamic> json) => PredictedValue(
        percentIncrease: json["percentIncrease"]?.toDouble(),
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percentIncrease": percentIncrease,
        "value": value,
      };
}

class Predictions {
  final PredictedValue pred3months;
  final PredictedValue pred6months;
  final PredictedValue pred1year;
  final PredictedValue pred2years;
  final PredictedValue pred3years;
  final PredictedValue pred5years;

  Predictions({
    required this.pred3months,
    required this.pred6months,
    required this.pred1year,
    required this.pred2years,
    required this.pred3years,
    required this.pred5years,
  });

  factory Predictions.fromJson(Map<String, dynamic> json) => Predictions(
    pred3months: PredictedValue.fromJson(json["3months"]),
    pred6months: PredictedValue.fromJson(json["6months"]),
    pred1year: PredictedValue.fromJson(json["1year"]),
    pred2years: PredictedValue.fromJson(json["2years"]),
    pred3years: PredictedValue.fromJson(json["3years"]),
    pred5years: PredictedValue.fromJson(json["5years"]),
  );

  Map<String, dynamic> toJson() => {
    "3months": pred3months.toJson(),
    "6months": pred6months.toJson(),
    "1year": pred1year.toJson(),
    "2years": pred2years.toJson(),
    "3years": pred3years.toJson(),
    "5years": pred5years.toJson(),
  };
}
