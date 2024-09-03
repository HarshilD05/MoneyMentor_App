import 'package:flutter/material.dart';
import 'package:moneymentor/harshil_widgets/tax_description_drop_down.dart';
import 'package:moneymentor/harshil_widgets/tax_display_card.dart';
import 'package:moneymentor/models/tax_calculation_data.dart';

class TaxComparisonPage extends StatefulWidget {
  final TaxCalculationData taxCalculationData;
  
  const TaxComparisonPage({super.key, required this.taxCalculationData});

  @override
  State<TaxComparisonPage> createState() => _TaxComparisonPageState();
}

class _TaxComparisonPageState extends State<TaxComparisonPage> {
  bool showOldRegime = false;
  bool showNewRegime = false;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tax Comparison'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Old Tax Regime
              GestureDetector(
                child: TaxDisplayCard(
                  title: "Old Tax Regime",
                  taxableSalary: double.parse(widget.taxCalculationData.taxableSalary.toStringAsFixed(2) ),
                  taxValue:
                      widget.taxCalculationData.taxOldRegime.toStringAsFixed(2),
                  netSalary: (widget.taxCalculationData.taxableSalary -
                          widget.taxCalculationData.taxOldRegime)
                      .toStringAsFixed(2),
                ),
                onTap: () {
                  setState(() {
                    showOldRegime = !showOldRegime;
                  });
                },
              ),

              (showOldRegime)
                  ? TaxDescriptionDropDown(taxCalculationData: widget.taxCalculationData, oldRegime: true)
                  : Container(),

              // New Tax Regime
              GestureDetector(
                child: TaxDisplayCard(
                  title: "New Tax Regime",
                  taxableSalary: double.parse(widget.taxCalculationData.taxableSalary.toStringAsFixed(2) ),
                  taxValue:
                      widget.taxCalculationData.taxNewRegime.toStringAsFixed(2),
                  netSalary: (widget.taxCalculationData.taxableSalary -
                          widget.taxCalculationData.taxNewRegime)
                      .toStringAsFixed(2),
                ),
                onTap: () {
                  setState(() {
                    showNewRegime = !showNewRegime;
                  });
                },
              ),

              (showNewRegime)
                  ? TaxDescriptionDropDown(taxCalculationData: widget.taxCalculationData, oldRegime: false)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
