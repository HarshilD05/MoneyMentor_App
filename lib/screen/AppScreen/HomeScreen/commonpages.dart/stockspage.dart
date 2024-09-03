import 'package:flutter/material.dart';
import 'package:moneymentor/screen/AppScreen/HomeScreen/commonpages.dart/data_search.dart';

class StockPage extends StatelessWidget {
  final StockSearchData stock;


  const StockPage({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stock.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(children: [
          Image.network(stock.urlImage,width: double.infinity,height: 300,fit: BoxFit.cover),
          
        ],),
      ),
    );
  }
}
