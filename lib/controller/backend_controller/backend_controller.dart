import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:moneymentor/models/stock_data_model.dart';


const String serverIP = "192.168.29.121";
const String apiURL = "http://$serverIP:5000/api/";

class StockJsonController extends GetxController {
  RxBool loading = false.obs;
  List<StockData>? stockDataList;

  @override
  void onInit() {
    // TODO: implement onInit
    getStockData();
    super.onInit();
  }

  Future<List<StockData>> getStockData() async {
    var response = await http.get(Uri.parse("${apiURL}getTopStocks"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<StockData> stockList =
          data.map((e) => StockData.fromJson(e)).toList();

      return stockList;
    } else {
      print("Failed to Load Stock Data : ${response.statusCode}");
      return [];
    }
  }
}
