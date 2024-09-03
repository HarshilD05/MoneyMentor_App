import 'dart:convert';

class PortfolioStockData {
  String stockName; // Fetch from API
  String ticker; // Provided in Form
  String iconURL; // Fetch from API
  double stockPurchasePrice; // Provided in Form
  double stockCurrentPrice; // Fetch from API
  int stockQuantity; // Provided in Form
  double stockTotalValue; // Calculated
  double stockTotalCost; // Calculated
  double stockProfitLoss; // Calculated
  double stockProfitLossPercentage; // Calculated

  PortfolioStockData({
    this.stockName = "",
    this.ticker = "",
    this.iconURL = "",
    this.stockPurchasePrice = 0,
    this.stockCurrentPrice = 0,
    this.stockQuantity = 0,
    this.stockTotalValue = 0,
    this.stockTotalCost = 0,
    this.stockProfitLoss = 0,
    this.stockProfitLossPercentage = 0,
  });

  // Parse obj from json
  factory PortfolioStockData.fromJson(Map<String, dynamic> json) {
    return PortfolioStockData(
      stockName: json['stockName'],
      ticker: json['ticker'],
      iconURL: json['iconURL'],
      stockPurchasePrice: json['stockPurchasePrice'],
      stockCurrentPrice: json['stockCurrentPrice'],
      stockQuantity: json['stockQuantity'],
      stockTotalValue: json['stockTotalValue'],
      stockTotalCost: json['stockTotalCost'],
      stockProfitLoss: json['stockProfitLoss'],
      stockProfitLossPercentage: json['stockProfitLossPercentage'],
    );
  }

  // Parse Obj to Json
  Map<String, dynamic> toJson() {
    return {
      'stockName': stockName,
      'ticker': ticker,
      'iconURL': iconURL,
      'stockPurchasePrice': stockPurchasePrice,
      'stockCurrentPrice': stockCurrentPrice,
      'stockQuantity': stockQuantity,
      'stockTotalValue': stockTotalValue,
      'stockTotalCost': stockTotalCost,
      'stockProfitLoss': stockProfitLoss,
      'stockProfitLossPercentage': stockProfitLossPercentage,
    };
  }

  void calculateStockData() {
    stockTotalValue = stockCurrentPrice * stockQuantity;
    stockTotalCost = stockPurchasePrice * stockQuantity;
    stockProfitLoss = stockTotalValue - stockTotalCost;
    stockProfitLossPercentage = stockProfitLoss / stockTotalCost;
  }
}

List<PortfolioStockData> parsePortfolioStockDataList(String jsonString) {
  return List<PortfolioStockData>.from(
      json.decode(jsonString).map((x) => PortfolioStockData.fromJson(x)));
}

String portfolioStockDataListToJson(List<PortfolioStockData> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class PortfolioScreenDataModel {
  final List<PortfolioStockData> portfolioStockDataList;
  double totalInvestmentMade = 0;
  double totalPortfolioValue = 0;
  double totalProfitLoss = 0;
  double totalProfitLossPercentage = 0;

  PortfolioScreenDataModel({
    this.portfolioStockDataList = const [],
  });

  double _calculateTotalInvestmentMade() {
    double totalInvestmentMade = 0;
    for (int i = 0; i < portfolioStockDataList.length; i++) {
      totalInvestmentMade += portfolioStockDataList[i].stockTotalCost;
    }
    return totalInvestmentMade;
  }

  double _calculateTotalPortfolioValue() {
    double totalPortfolioValue = 0;
    for (int i = 0; i < portfolioStockDataList.length; i++) {
      totalPortfolioValue += portfolioStockDataList[i].stockTotalValue;
    }
    return totalPortfolioValue;
  }

  double _calculateTotalProfitLoss() {
    return totalPortfolioValue - totalInvestmentMade;
  }

  double _calculateTotalProfitLossPercentage() {
    return (totalPortfolioValue - totalInvestmentMade) / totalInvestmentMade;
  }

  void calculatePortfolioData() {
    totalInvestmentMade = _calculateTotalInvestmentMade();
    totalPortfolioValue = _calculateTotalPortfolioValue();
    totalProfitLoss = _calculateTotalProfitLoss();
    totalProfitLossPercentage = _calculateTotalProfitLossPercentage();
  }

  void addStockToPortfolio(PortfolioStockData stock) {
    portfolioStockDataList.add(stock);
    calculatePortfolioData();
  }

  void removeStockFromPortfolio(PortfolioStockData stock) {
    portfolioStockDataList.remove(stock);
    calculatePortfolioData();
  }

  // Parse obj from json
  factory PortfolioScreenDataModel.fromJson(Map<String, dynamic> json) {
    return PortfolioScreenDataModel(
      portfolioStockDataList:
          parsePortfolioStockDataList(json['portfolioStockDataList']),
    );
  }

  // Parse Obj to Json
  Map<String, dynamic> toJson() {
    return {
      "portfolioStockDataList":
          portfolioStockDataListToJson(portfolioStockDataList),
      "totalInvestmentMade": totalInvestmentMade,
      "totalPortfolioValue": totalPortfolioValue,
      "totalProfitLoss": totalProfitLoss,
      "totalProfitLossPercentage": totalProfitLossPercentage,
    };
  }
}
