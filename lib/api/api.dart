import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:http/http.dart" as http;
import 'package:moneymentor/models/stock_data_model.dart';
import 'package:moneymentor/screen/AppScreen/porfolioscreen/porfolioscreen.dart';

const String serverIP = "192.168.11.167";
const String serverPort = "5000";
const String apiURL = "http://$serverIP:$serverPort/api/";

// All API Fetch Functions

// API to fetch Trending Stocks
Future<List<StockData>> fetchTrendingStocks() async {
  // Fetch the Top Stocks for the last 7 days
  final response = await http.get(Uri.parse("${apiURL}fetchTrendingStocks"));
  if (response.statusCode == 200) {
    Map<String,dynamic> data = jsonDecode(response.body);
    List<dynamic> trendingList = data["trendingStocks"];
    List<StockData> stockList = trendingList.map((e) => StockData.fromJson(e)).toList();
    return stockList;
  } else {
    print("Failed to Load Trending Stocks : ${response.statusCode}");
    return [];
  }
}

// API to fetch Top Stocks
Future<List<StockData>> fetchTopStocks() async {
  // Fetch the Top Stocks for the past month
  final response =
      await http.get(Uri.parse("${apiURL}fetchTopStocks"));
  if (response.statusCode == 200) {
    Map<String,dynamic> data = jsonDecode(response.body);
    List<dynamic> topStocks = data["topStocks"];
    List<StockData> stockList = topStocks.map((e) => StockData.fromJson(e)).toList();
    return stockList;
  } else {
    print("Failed to Load Top Stocks : ${response.statusCode}");
    return [];
  }
}

// API to fetch Recommended Stocks based on Investment amount
Future<List<StockData>> fetchRecommendedStocks(
    {int investmentAmt = 0, int nTopStocks = 7, int months = 12}) async {
  // Fetch the Top Stocks for the last 7 days
  final response = await http.get(Uri.parse(
      "${apiURL}recommendStocks?amt=$investmentAmt&months=$months&nStocks=$nTopStocks"));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<StockData> stockList = data.map((e) => StockData.fromJson(e)).toList();
    return stockList;
  } else {
    print("Failed to Load Recommended Stocks : ${response.statusCode}");
    return [];
  }
}

// API to fetch the Portfolio Data of a Stock
Future<PortfolioStockData> fetchStockPortfolioData(
    String ticker, int quantity, double purchasePrice) async {
  final response = await http
      .get(Uri.parse("${apiURL}getStockPortfolioData?ticker=$ticker"));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    PortfolioStockData portfolioStockData = PortfolioStockData(
      stockName: data['stockName'],
      ticker: ticker,
      iconURL: data['iconURL'],
      stockPurchasePrice: purchasePrice,
      stockCurrentPrice: data['currPrice'],
      stockQuantity: quantity,
    );
    portfolioStockData.calculateStockData();
    return portfolioStockData;
  } else {
    print("Failed to Load Stock Portfolio Data : ${response.statusCode}");
    return PortfolioStockData();
  }
}

// API to Fetch Users Portfolio Data from FireStore
Future<PortfolioScreenDataModel> fetchUserPortfolio(String username) async {
  try {
    // Get a reference to the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Get the document snapshot
    DocumentSnapshot documentSnapshot =
        await firestore.collection('UserPortfolios').doc(username).get();

    // Check if the document exists
    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      PortfolioScreenDataModel portfolioScreenData =
          PortfolioScreenDataModel.fromJson(data);
      return portfolioScreenData;
    } else {
      // Create a new Document for the User
      PortfolioScreenDataModel portfolioScreenData = PortfolioScreenDataModel();

      await firestore
          .collection('UserPortfolios')
          .doc(username)
          .set(portfolioScreenData.toJson(), SetOptions(merge: true));

      return portfolioScreenData;
    }
  } catch (e) {
    print("Failed to Load User Portfolio Data : $e");
    return PortfolioScreenDataModel();
  }
}

// API to Update Users Portfolio Data in FireStore
Future<void> updateUserPortfolio(
    String username, PortfolioScreenDataModel portfolioData) async {
  try {
    // Get a reference to the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore
        .collection('UserPortfolios')
        .doc(username)
        .set(portfolioData.toJson(), SetOptions(merge: true));
  } catch (e) {
    print("Failed to Update User Portfolio Data : $e");
  }
}

// API to get the Short Term Stocks
Future<List<StockData>> fetchShortTermStocks() async {
  final response = await http.get(Uri.parse("${apiURL}getFutureTopStocks?months=3&nTopStocks=10"));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<StockData> stockList = data.map((e) => StockData.fromJson(e)).toList();
    return stockList;
  } else {
    print("Failed to Load Short Term Stocks : ${response.statusCode}");
    return [];
  }
}

// API to get the Medium Term Stocks
Future<List<StockData>> fetchMediumTermStocks() async {
  final response = await http.get(Uri.parse("${apiURL}getFutureTopStocks?months=12&nTopStocks=10"));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<StockData> stockList = data.map((e) => StockData.fromJson(e)).toList();
    return stockList;
  } else {
    print("Failed to Load Medium Term Stocks : ${response.statusCode}");
    return [];
  }
}

// API to get the Long Term Stocks
Future<List<StockData>> fetchLongTermStocks() async {
  final response = await http.get(Uri.parse("${apiURL}getFutureTopStocks?months=36&nTopStocks=10"));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<StockData> stockList = data.map((e) => StockData.fromJson(e)).toList();
    return stockList;
  } else {
    print("Failed to Load Long Term Stocks : ${response.statusCode}");
    return [];
  }
}