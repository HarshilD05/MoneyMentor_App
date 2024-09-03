import 'package:flutter/material.dart';
import 'package:moneymentor/screen/AppScreen/porfolioscreen/porfolioscreen.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class PortfolioCard extends StatelessWidget {
  final PortfolioScreenDataModel portfolioData;

  const PortfolioCard({
    super.key,
    required this.portfolioData,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4, left: 12, right: 12),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Portfolio Value',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "$indianruppes${portfolioData.totalPortfolioValue.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 32.0,
                ),
              ),
              //
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Gained ProfitLoss
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Today"),
                        (portfolioData.totalProfitLoss > 0)
                            ? const Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.red,
                              ),
                        Text(
                          "$indianruppes${portfolioData.totalProfitLoss.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: (portfolioData.totalProfitLoss > 0)
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    )),

                    // Gained ProfitLoss Percentage
                    Container(
                        child: Row(
                      children: [
                        (portfolioData.totalProfitLossPercentage > 0)
                            ? const Icon(
                                Icons.trending_up,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.trending_down,
                                color: Colors.red,
                              ),
                        Text(
                          "${portfolioData.totalProfitLossPercentage.toStringAsFixed(2)}%",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: (portfolioData.totalProfitLossPercentage > 0)
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
