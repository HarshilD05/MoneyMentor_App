import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:moneymentor/models/stock_data_model.dart';
import 'package:flutter/material.dart';
import 'package:moneymentor/screen/Stock_predition.dart/stocks_drop_down.dart';
import 'package:moneymentor/utils/constants/fontstyles.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class TrendingStocks extends StatelessWidget {
  final StockData stockData;
  const TrendingStocks({super.key, required this.stockData});

  @override
  Widget build(BuildContext context) {
    Color changeColor (value) => value > 0
        ? Colors.green
        : Colors.red; // Set color based on change

    int l = stockData.historicalData.length;
    double pastWeekValue = stockData.historicalData[l - 7].close;
    double growthValue = stockData.currPrice - pastWeekValue;

    final bool dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => OnClickScreen(stockData: stockData)),
      child: Container(
        margin: const EdgeInsets.fromLTRB(6, 0, 6, 3),
        decoration: BoxDecoration(
          color: dark ? Colors.black : 
          Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2.0,
              blurRadius: 5.0,
            )
          ],
        ),
        height: 120,
        width: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    height: 45,
                    width: 45,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        stockData.iconUrl, // Replace with your image URL
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Text('Error loading image: $error');
                          //print("Error Loading the Image : $error");
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 69,
                            height: 20,
                            child: Marquee(
                              text: stockData.stockName,
                              style: const TextStyle(
                                fontFamily: semibold,
                                fontSize: 13,
                              ),
                              scrollAxis: Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              blankSpace: 20.0,
                              velocity: 50.0,
                              pauseAfterRound: const Duration(seconds: 3),
                              showFadingOnlyWhenScrolling: true,
                              fadingEdgeStartFraction: 0.1,
                              fadingEdgeEndFraction: 0.1,
                              startPadding: 3.0,
                              accelerationDuration: const Duration(seconds: 1),
                              accelerationCurve: Curves.linear,
                              decelerationDuration: const Duration(milliseconds: 500),
                              decelerationCurve: Curves.easeOut,
                            ),
                          ),
                        ),
                        Text(
                          stockData.ticker,
                          style: const TextStyle(
                            fontFamily: regular,
                            fontSize: 7,
                          ),
                        ),

                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: SizedBox(
                        //     width: 70,
                        //     height: 20,
                        //     child: Marquee(
                        //       text: stockData.ticker,
                        //       style: const TextStyle(
                        //         fontFamily: semibold,
                        //         fontSize: 7,
                        //       ),
                        //       scrollAxis: Axis.horizontal,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       blankSpace: 20.0,
                        //       velocity: 50.0,
                        //       pauseAfterRound: Duration(seconds: 3),
                        //       showFadingOnlyWhenScrolling: true,
                        //       fadingEdgeStartFraction: 0.1,
                        //       fadingEdgeEndFraction: 0.1,
                        //       startPadding: 10.0,
                        //       accelerationDuration: Duration(seconds: 1),
                        //       accelerationCurve: Curves.linear,
                        //       decelerationDuration: Duration(milliseconds: 500),
                        //       decelerationCurve: Curves.easeOut,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "$indianruppes ${stockData.currPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontFamily: semibold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              growthValue  > 0
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              size: 18.0,
                              color: changeColor(growthValue), // Use the calculated color
                            ),
                            Text(
                              "${growthValue.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: changeColor(growthValue), // Use the calculated color
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: stockData.percentGrowth > 0
                              ? Colors.green[500]
                              : Colors.red[500],
                          backgroundColor: stockData.percentGrowth > 0
                              ? Colors.green[100]
                              : Colors.red[100],
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 8,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "${stockData.percentGrowth}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
