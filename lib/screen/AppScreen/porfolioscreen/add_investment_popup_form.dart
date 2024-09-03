import "package:flutter/material.dart";
import "package:moneymentor/api/api.dart";
import "package:moneymentor/screen/AppScreen/porfolioscreen/porfolioscreen.dart";

class AddInvestmentPopupForm extends StatefulWidget {
  final void Function(PortfolioStockData portfolioStockData) onSubmit;

  const AddInvestmentPopupForm({super.key, required this.onSubmit});

  @override
  _AddInvestmentPopupFormState createState() => _AddInvestmentPopupFormState();
}

class _AddInvestmentPopupFormState extends State<AddInvestmentPopupForm> {
  final TextEditingController tickerController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController purchaseValueController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Investment Details'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: tickerController,
              decoration: const InputDecoration(labelText: 'Stock Ticker'),
            ),
            TextFormField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity Purchased'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: purchaseValueController,
              decoration: const InputDecoration(labelText: 'Purchase Value'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final String ticker = tickerController.text;
            final int quantity = int.parse(quantityController.text);
            final double purchaseValue = double.parse(purchaseValueController.text);
            fetchStockPortfolioData(ticker, quantity, purchaseValue).then((portfolioStockData) {
              widget.onSubmit(portfolioStockData);
            });
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    tickerController.dispose();
    quantityController.dispose();
    purchaseValueController.dispose();
    super.dispose();
  }

}
