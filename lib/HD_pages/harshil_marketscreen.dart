import "package:flutter/material.dart";
import "package:moneymentor/api/api.dart";
import "package:moneymentor/harshil_widgets/HD_StockWidget.dart";
import "package:moneymentor/harshil_widgets/trendingstock_widget.dart";
import "package:moneymentor/models/stock_data_model.dart";
import "package:moneymentor/utils/constants/fontstyles.dart";

class MarketHarshilScreen extends StatefulWidget {
  // final List<StockData> trendingStocksList;
  // final List<StockData> recommedationStocksList;
  // final List<StockData> topStocksList;

  MarketHarshilScreen({
    super.key,
    // required this.trendingStocksList,
    // required this.topStocksList,
    // required this.recommedationStocksList,
  });

  @override
  State<MarketHarshilScreen> createState() => _MarketHarshilScreenState();
}

class _MarketHarshilScreenState extends State<MarketHarshilScreen> {
  List<StockData> trendingStocksList = [];
  List<StockData> recommedationStocksList = [];
  List<StockData> topStocksList = [];

  @override
  void initState() {
    super.initState();

    // Fetching the TrendingStocks
    fetchTrendingStocks().then((value) => setState(() {
      trendingStocksList = value;
    }));

    // Fethcing Top Stocks
    fetchTopStocks().then((value) => setState(() {
      topStocksList = value;
    }));

    // Fetching Recommended Stocks
    fetchRecommendedStocks().then((value) => setState(() {
      recommedationStocksList = value;
    }));

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 10, 0),
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending Stocks",
                          style: TextStyle(fontFamily: bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  //-->>
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: (trendingStocksList.isEmpty)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Row(
                              children:
                                  trendingStocksList.map((StockData obj) {
                                return TrendingStocks(stockData: obj);
                              }).toList(),
                            ),
                    ),
                  ),
                  //--->>
                  //--->>
                  const Text(
                    "Top Stocks",
                    style: TextStyle(fontFamily: bold, fontSize: 20),
                  ),

                  // //-->> Work Here
                  SizedBox(
                    child: Column(
                        children: topStocksList.map((StockData obj) {
                      return StockPriceWidget(
                        stockData: obj,
                      );
                    }).toList()),
                  ),

                  //-->>>
                  const Text(
                    "Recommendation Stocks",
                    style: TextStyle(fontFamily: bold, fontSize: 20),
                  ),
                  // //-->> Work Here
                  SizedBox(
                    child: Column(
                        children: recommedationStocksList.map((StockData obj) {
                      return StockPriceWidget(
                        stockData: obj,
                      );
                    }).toList()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
