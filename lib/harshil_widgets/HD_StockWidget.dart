import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:marquee/marquee.dart";
import "package:moneymentor/harshil_widgets/HD_DropDownPanel.dart";
import "package:moneymentor/models/stock_data_model.dart";
import "package:moneymentor/screen/Stock_predition.dart/stocks_drop_down.dart";
import "package:moneymentor/utils/constants/fontstyles.dart";
import "package:moneymentor/utils/constants/text_strings.dart";
import "package:moneymentor/utils/helpers/helper_functions.dart";

class StockPriceWidget extends StatefulWidget {
  final StockData stockData;

  const StockPriceWidget({super.key, required this.stockData});

  @override
  State<StockPriceWidget> createState() => _StockPriceWidgetState();
}

class _StockPriceWidgetState extends State<StockPriceWidget> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      child: Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: dark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          child: Column(children: [
            GestureDetector(
              onDoubleTap: () => {
                Get.to(()=> OnClickScreen(stockData: widget.stockData))
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Image and Name Container
                      Container(
                        width: 50,
                        height: 50,
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
                        child: Row(
                          children: [
                            // Stock Image
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 48,
                                width: 48,
                                child: Image.network(
                                  widget.stockData.iconUrl,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            // Stock Name Container
                            Container(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                // mainAxisAlignment:
                                // MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Stock Name
                                  // Text(
                                  //   widget.stockData.stockName,
                                  //   style: const TextStyle(
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold),
                                  // ),

                                  // SingleChildScrollView(
                                  //   scrollDirection: Axis.horizontal,
                                  //   child: SizedBox(
                                  //     width: 120,
                                  //     height: 40,
                                  //     child: Marquee(
                                  //       text: widget.stockData.stockName,
                                  //       style: const TextStyle(
                                  //         fontFamily: semibold,
                                  //         fontSize: 20,
                                  //       ),
                                  //       scrollAxis: Axis.horizontal,
                                  //       crossAxisAlignment: CrossAxisAlignment.start,
                                  //       blankSpace: 20.0,
                                  //       velocity: 50.0,
                                  //       pauseAfterRound: const Duration(seconds: 3),
                                  //       showFadingOnlyWhenScrolling: true,
                                  //       fadingEdgeStartFraction: 0.1,
                                  //       fadingEdgeEndFraction: 0.1,
                                  //       startPadding: 3.0,
                                  //       accelerationDuration: const Duration(seconds: 1),
                                  //       accelerationCurve: Curves.linear,
                                  //       decelerationDuration: const Duration(milliseconds: 500),
                                  //       decelerationCurve: Curves.easeOut,
                                  //     ),
                                  //   ),
                                  // ),

                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: SizedBox(
                                      width: 160,
                                      height: 30,
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          final text = Text(
                                            widget.stockData.stockName,
                                            style: const TextStyle(
                                              fontFamily: 'bold',
                                              fontSize: 20,
                                            ),
                                          );

                                          final textPainter = TextPainter(
                                            text: TextSpan(
                                                text:
                                                    widget.stockData.stockName,
                                                style: const TextStyle(
                                                    fontFamily: 'bold',
                                                    fontSize: 20)),
                                            maxLines: 1,
                                            textDirection: TextDirection.ltr,
                                          );

                                          textPainter.layout(
                                              minWidth: 0,
                                              maxWidth: double.infinity);

                                          final textWidth =
                                              textPainter.size.width;

                                          if (textWidth >
                                              constraints.maxWidth) {
                                            return Marquee(
                                              text: widget.stockData.stockName,
                                              style: const TextStyle(
                                                fontFamily: "bold",
                                                fontSize: 20,
                                              ),
                                              scrollAxis: Axis.horizontal,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              blankSpace: 20.0,
                                              velocity: 50.0,
                                              pauseAfterRound:
                                                  const Duration(seconds: 3),
                                              showFadingOnlyWhenScrolling: true,
                                              fadingEdgeStartFraction: 0.1,
                                              fadingEdgeEndFraction: 0.1,
                                              startPadding: 3.0,
                                              accelerationDuration:
                                                  const Duration(seconds: 1),
                                              accelerationCurve: Curves.linear,
                                              decelerationDuration:
                                                  const Duration(
                                                      milliseconds: 500),
                                              decelerationCurve: Curves.easeOut,
                                            );
                                          } else {
                                            return text;
                                          }
                                        },
                                      ),
                                    ),
                                  ),

                                  // Stock Ticker
                                  Text(
                                    widget.stockData.ticker,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(157, 157, 158, 1),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // Stock Price Container
                      Container(
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Stock Price
                            Text(
                              indianruppes +
                                  widget.stockData.currPrice.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // Stock Change
                            Row(children: [
                              (widget.stockData.percentGrowth > 0)
                                  ? const Icon(Icons.trending_up,
                                      color: Colors.green)
                                  : const Icon(
                                      Icons.trending_down,
                                      color: Colors.red,
                                    ),
                              Text(
                                widget.stockData.percentGrowth.toString(),
                                style: TextStyle(
                                  color: widget.stockData.percentGrowth > 0
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 12,
                                ),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            _isTapped
                ? DropDownPanel(
                    stockName: widget.stockData.stockName,
                    historicalData: widget.stockData.historicalData,
                  )
                : Container()
          ])),
    );
  }
}
