import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymentor/HD_pages/salary_input_form.dart';
import 'package:moneymentor/api/api.dart';
import 'package:moneymentor/common/widget/trade_idea.dart';
import 'package:moneymentor/harshil_widgets/trendingstock_widget.dart';
import 'package:moneymentor/models/stock_data_model.dart';
import 'package:moneymentor/models/tax_calculation_data.dart';
import 'package:moneymentor/screen/AppScreen/HomeScreen/commonpages.dart/selection_selecting.dart';
import 'package:moneymentor/screen/AppScreen/HomeScreen/commonpages.dart/slider_.dart';
import 'package:moneymentor/utils/constants/fontstyles.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';

class HomePageScreen extends StatefulWidget {
  // final List<StockData> trendingStocksList;
  const HomePageScreen({
    super.key,
    // required this.trendingStocksList,
  });

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<StockData> trendingStocksList = [];

  @override
  void initState() {
    super.initState();
    fetchTrendingStocks().then((value) => setState(() {
      trendingStocksList = value;
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
          margin: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today Trending Stocks",
                        style: TextStyle(fontFamily: bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),

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

                const SizedBox(height: 20),
                SliderWidget(sliderImagesStrList: const [TImages.group4,TImages.group5,TImages.group2],),
                const SizedBox(height: 20),
                const SelecterWidget(),
                const SizedBox(height: 20),
                const TradeIdeas(),
                const SizedBox(height: 20),
                SliderWidget(sliderImagesStrList: const [TImages.group1,TImages.group3,TImages.group6],),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                          Get.to(() => SalaryComponentsForm(taxCalculationData: TaxCalculationData(),));
                        },
                    child: Center(
                      child: Image.asset(
                        TImages.taxablecal,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        // Ensures image fills container
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
