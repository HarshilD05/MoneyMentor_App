import 'package:flutter/material.dart';
import 'package:moneymentor/screen/AppScreen/porfolioscreen/porfolioscreen.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class PortfolioStockWidget extends StatefulWidget {
  PortfolioStockData portfolioStockData;
  final void Function(PortfolioStockData portfolioStockData) onRemove;

  PortfolioStockWidget({super.key, 
    required this.portfolioStockData,
    required this.onRemove,
  });

  @override
  State<PortfolioStockWidget> createState() => _PortfolioStockWidgetState();
}

class _PortfolioStockWidgetState extends State<PortfolioStockWidget> {
  bool _showDeleteIcon = false;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.all(20),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // StockName and Quantity
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.portfolioStockData.stockName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " QTY : ${widget.portfolioStockData.stockQuantity}",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),

                // Stock Current Value and ProfitLoss
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$indianruppes${widget.portfolioStockData.stockCurrentPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        (widget.portfolioStockData.stockProfitLoss > 0)
                            ? const Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.red,
                              ),
                        Text(
                          "$indianruppes${(widget.portfolioStockData.stockCurrentPrice - widget.portfolioStockData.stockPurchasePrice).toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                (widget.portfolioStockData.stockProfitLoss > 0)
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        ),
                      ],
                    )),
                  ],
                )),

                // Total Stock Value and Total Gain
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$indianruppes${widget.portfolioStockData.stockTotalValue.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        (widget.portfolioStockData.stockProfitLoss > 0)
                            ? const Icon(
                                Icons.trending_up,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.trending_down,
                                color: Colors.red,
                              ),
                        Text(
                          "${widget.portfolioStockData.stockProfitLossPercentage.toStringAsFixed(2)}%",
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                (widget.portfolioStockData.stockProfitLoss > 0)
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        ),
                      ],
                    )),
                  ],
                ))
              ],
            ),
          ),

          // Delete Icon
          (_showDeleteIcon)
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 209, 209),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        // When Delete Icon Pressed Show an Alert Box
                        //Asking Are you sure you want to Remove Investment from Portfolio tracker
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Remove Investment'),
                              content: const Text(
                                  'Are you sure you want to remove this Investment from Portfolio Tracker?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(255, 242, 175, 171)),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget
                                          .onRemove(widget.portfolioStockData);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Remove',
                                      style: TextStyle(
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ))
              : Container(),
        ]),
      ),

      // On Long Press Show a Delete Hover Icon on the Top Right of the Widget
      onLongPress: () {
        setState(() {
          _showDeleteIcon = true;
        });
      },

      // On Tap If Icon is Shown then hide the Icon
      onTap: () {
        if (_showDeleteIcon) {
          setState(() {
            _showDeleteIcon = false;
          });
        }
      },
    );
  }
}
