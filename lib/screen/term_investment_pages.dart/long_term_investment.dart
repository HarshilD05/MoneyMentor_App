import 'package:flutter/material.dart';
import 'package:moneymentor/api/api.dart';
import 'package:moneymentor/harshil_widgets/HD_StockWidget.dart';
import 'package:moneymentor/models/stock_data_model.dart';
import 'package:moneymentor/utils/constants/fontstyles.dart';

class Long_Term_Inv extends StatefulWidget {
  const Long_Term_Inv({super.key});

  @override
  State<Long_Term_Inv> createState() => _Long_Term_InvState();
}

class _Long_Term_InvState extends State<Long_Term_Inv> {
  List<StockData> longTermInvestmentsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchLongTermStocks().then((value) => longTermInvestmentsList = value);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Text(
                    "Long Term Investment Stocks",
                    style: TextStyle(fontFamily: bold, fontSize: 20),
                  ),
                ),
                Container(
                  child: (longTermInvestmentsList.isEmpty)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        :Column(
                    children: longTermInvestmentsList.map((StockData obj) {
                        return StockPriceWidget(
                          stockData: obj,
                        );
                      }).toList()),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}