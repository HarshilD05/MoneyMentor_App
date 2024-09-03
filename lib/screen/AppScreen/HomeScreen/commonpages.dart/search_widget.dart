import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moneymentor/screen/AppScreen/HomeScreen/commonpages.dart/data_search.dart';
import 'package:moneymentor/screen/AppScreen/HomeScreen/commonpages.dart/stockspage.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final controller = TextEditingController();
  List<StockSearchData> stocks = allstock;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.search_normal_1),
                hintText: 'Search For Stocks ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onChanged: searchstock,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stocks.length,
              itemBuilder: (context, index) {
                final stock = stocks[index];
                return ListTile(
                  leading: Image.network(
                    stock.urlImage,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(stock.title),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StockPage(stock: stock),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void searchstock(String query) {
    final suggestions = allstock.where((stock) {
      final stocktitle = stock.title.toLowerCase();
      final input = query.toLowerCase();
      return stocktitle.contains(input);
    }).toList();

    setState(() => stocks = suggestions);
  }
}
