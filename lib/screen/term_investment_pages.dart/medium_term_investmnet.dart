import 'package:flutter/material.dart';
import 'package:moneymentor/api/api.dart';
import 'package:moneymentor/harshil_widgets/HD_StockWidget.dart';
import 'package:moneymentor/models/stock_data_model.dart';
import 'package:moneymentor/utils/constants/fontstyles.dart';

class Medium_term_inv extends StatefulWidget {
  const Medium_term_inv({super.key});

  @override
  State<Medium_term_inv> createState() => _Medium_term_invState();
}

class _Medium_term_invState extends State<Medium_term_inv> {
  List<StockData> midTermInvestmentsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchMediumTermStocks().then((value) => midTermInvestmentsList = value);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                "Medium Term Investment Stocks",
                style: TextStyle(fontFamily: bold, fontSize: 20),
              ),
              Container(
                child: Column(
                  children: midTermInvestmentsList.map((StockData obj) {
                      return StockPriceWidget(
                        stockData: obj,
                      );
                    }).toList()),
              )
            ],
          ),
        ),
      )
    );
  }
}