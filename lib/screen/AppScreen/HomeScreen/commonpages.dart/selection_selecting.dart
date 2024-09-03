import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/HD_pages/harshil_marketscreen.dart';
import 'package:moneymentor/HD_pages/salary_input_form.dart';
import 'package:moneymentor/models/tax_calculation_data.dart';
import 'package:moneymentor/screen/AppScreen/HomeScreen/common_Screen_widget.dart';
import 'package:moneymentor/screen/AppScreen/HomeScreen/selector_pages/medium_term_inv.dart';
import 'package:moneymentor/screen/term_investment_pages.dart/long_term_investment.dart';
import 'package:moneymentor/screen/term_investment_pages.dart/short_investemnt_pages.dart';
import 'package:moneymentor/utils/helpers/helper_functions.dart';

class SelecterWidget extends StatelessWidget {
  const SelecterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return Container(
        margin: const EdgeInsets.fromLTRB(6, 0, 6, 3),
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
        width: double.infinity,
        height: 196,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: CustomIconButton(
                          iconData: Iconsax.activity, text: "Long term Inv.."),
                      onTap: (){
                        Get.to(() => ShortInvestmentScreen());
                      }
                    ),
                    GestureDetector(
                      child: CustomIconButton(
                          iconData: Iconsax.diagram,
                          text: "Medium term Inv.."),
                      
                      onTap: () {
                        Get.to(() => const Medium_Term_Inv());
                      },
                    ),
                    GestureDetector(
                      child: CustomIconButton(
                          iconData: Iconsax.status_up,
                          text: "Short term Inv.."),

                      onTap: () {
                        Get.to(() => ShortInvestmentScreen());
                      },
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       CustomIconButton(
              //           onTap: () {
              //             // Get.to(() => SalaryComponentsForm());
              //           },
              //           iconData: Iconsax.empty_wallet,
              //           text: "Portfolio"),
              //       CustomIconButton(
              //           onTap: () {
              //             Get.to(() => SalaryComponentsForm(taxCalculationData: TaxCalculationData(),));
              //           },
              //           iconData: Iconsax.math,
              //           text: "Tax Calculator"),
              //       // CustomIconButton(
              //       //     onTap: () {
              //       //       Get.to(() => MarketHarshilScreen());
              //       //     },
              //       //     iconData: Iconsax.house,
              //       //     text: "Market"),
              //     ],
              //   ),
              // )
            ],
          ),
        ));
  }
}
