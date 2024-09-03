import "package:flutter/material.dart";
import 'package:moneymentor/api/api.dart';
import 'package:moneymentor/common/widget/primaryheader.dart';
import 'package:moneymentor/demo/demo_cart.dart';
import 'package:moneymentor/screen/AppScreen/porfolioscreen/add_investment_popup_form.dart';
import 'package:moneymentor/screen/AppScreen/porfolioscreen/porfolioscreen.dart';
import 'package:moneymentor/screen/AppScreen/porfolioscreen/portfolio_stock_widget.dart';

class PortfolioScreen extends StatefulWidget {
  final String username;
  PortfolioScreen({super.key, required this.username});

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  PortfolioScreenDataModel portfolioScreenData = PortfolioScreenDataModel();

  @override
  void initState() {
    super.initState();
    fetchUserPortfolio(widget.username).then((value) => setState(() {
      portfolioScreenData = value;
      portfolioScreenData.calculatePortfolioData();
    }));
  }

  void removeInvestment(PortfolioStockData portfolioStockData) {
    setState(() {
      portfolioScreenData.portfolioStockDataList.remove(portfolioStockData);
      portfolioScreenData.calculatePortfolioData();
      updateUserPortfolio(widget.username, portfolioScreenData);
    });
  }

  @override
  Widget build(BuildContext context) {
    onRemoveFn(portfolioStockData) {
      removeInvestment(portfolioStockData);
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
            child: Column(
              children: [
                // PortfolioValueDisplay(portfolioData: portfolioScreenData),
                const SizedBox(height: 60),
                PortfolioCard(portfolioData: portfolioScreenData),
                // PieChart for Stock Distribution
                const SizedBox(height: 60),
              ],
            ),
          ),
          // List of Investments
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Investments",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children:
                    portfolioScreenData.portfolioStockDataList.map((stock) {
                  return PortfolioStockWidget(
                    portfolioStockData: stock,
                    onRemove: onRemoveFn,
                  );
                }).toList(),
              )),

          // Add Investment Icon Button
          Center(
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddInvestmentPopupForm(
                          onSubmit: (portfolioStockData) {
                        setState(() {
                          portfolioScreenData.portfolioStockDataList
                              .add(portfolioStockData);
                          portfolioScreenData.calculatePortfolioData();
                          updateUserPortfolio(widget.username, portfolioScreenData);
                        });
                      });
                    });
              },
            ),
          )
        ],
      ),
    ));
  }
}
