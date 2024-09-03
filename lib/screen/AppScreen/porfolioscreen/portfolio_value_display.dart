import 'package:flutter/material.dart';
import 'package:moneymentor/screen/AppScreen/porfolioscreen/porfolioscreen.dart';
import 'package:moneymentor/utils/constants/text_strings.dart';


class PortfolioValueDisplay extends StatelessWidget {
  PortfolioScreenDataModel portfolioData;

  PortfolioValueDisplay({super.key, required this.portfolioData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
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
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Portfolio Value",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            "$indianruppes${portfolioData.totalPortfolioValue.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Gained ProfitLoss
                Container(
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (portfolioData.totalProfitLoss > 0) ?
                      const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.green,
                      ) :
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                      ),
                      Text(
                        "$indianruppes${portfolioData.totalProfitLoss.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: (portfolioData.totalProfitLoss > 0) ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  )
                ),
            
                // Gained ProfitLoss Percentage
                Container(
                  child : Row(
                    children: [
                      (portfolioData.totalProfitLossPercentage > 0) ?
                      const Icon(
                        Icons.trending_up,
                        color: Colors.green,
                      ) :
                      const Icon(
                        Icons.trending_down,
                        color: Colors.red,
                      ),
                      Text(
                        "${portfolioData.totalProfitLossPercentage.toStringAsFixed(2)}%",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: (portfolioData.totalProfitLossPercentage > 0) ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
