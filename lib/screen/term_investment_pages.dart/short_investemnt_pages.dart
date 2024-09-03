import 'package:flutter/material.dart';
import 'package:moneymentor/api/api.dart';
import 'package:moneymentor/harshil_widgets/HD_StockWidget.dart';
import 'package:moneymentor/models/stock_data_model.dart';
import 'package:moneymentor/utils/constants/fontstyles.dart';

class ShortInvestmentScreen extends StatefulWidget {
  const ShortInvestmentScreen({super.key});

  @override
  State<ShortInvestmentScreen> createState() => _ShortInvestmentScreenState();
}

class _ShortInvestmentScreenState extends State<ShortInvestmentScreen> {
  List<StockData> shortTermInvestmentsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchShortTermStocks().then((value) => shortTermInvestmentsList = value);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin : EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    "Short Term Investment Stocks",
                    style: TextStyle(fontFamily: bold, fontSize: 20),
                  ),
          
                  Container(
                    child: Column(
                      children: shortTermInvestmentsList.map((StockData obj) {
                          return StockPriceWidget(
                            stockData: obj,
                          );
                        }).toList()),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}