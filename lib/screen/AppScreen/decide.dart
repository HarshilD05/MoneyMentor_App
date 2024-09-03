import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneymentor/HD_pages/harshil_marketscreen.dart';
import 'package:moneymentor/auth/authentication.dart';
import 'package:moneymentor/auth/data/user_model.dart';
import 'package:moneymentor/models/stock_data_model.dart';
import 'package:moneymentor/screen/AppScreen/HomeScreen/home_screen_.dart';
import 'package:moneymentor/screen/AppScreen/porfolioscreen/portfolio_screen.dart';
import 'package:moneymentor/screen/AppScreen/profileScreen/profile_screen_.dart';
import "package:moneymentor/api/api.dart";

class DecideScreen extends StatefulWidget {
  final UserModel userData;
  DecideScreen({super.key, required this.userData});

  @override
  State<DecideScreen> createState() => _DecideScreenState();
}

class _DecideScreenState extends State<DecideScreen> {
  late List<Widget> _screens;
  late String username = "testUser";
  // late List<StockData> trendingStockList = [];
  // late List<StockData> topStockList = [];
  // late List<StockData> recommendedStockList = [];
  // late List<StockData> shortTermStockList = [];
  // late List<StockData> midTermStockList = [];
  // late List<StockData> longTermStockList = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    username = widget.userData.username;
    // // Fetching the TrendingStocks
    // fetchTrendingStocks().then((value) => setState(() {
    //   trendingStockList = value;
    // }));

    // // Fethcing Top Stocks
    // fetchTopStocks().then((value) => setState(() {
    //   topStockList = value;
    // }));

    // // Fetching Recommended Stocks
    // fetchRecommendedStocks().then((value) => setState(() {
    //   recommendedStockList = value;
    // }));

    // // Fetching Short Term Stocks
    // fetchShortTermStocks().then((value) => setState(() {
    //   shortTermStockList = value;
    // }));

    // // Fetching Mid Term Stocks
    // fetchMediumTermStocks().then((value) => setState(() {
    //   midTermStockList = value;
    // }));

    // // Fetching Long Term Stocks
    // fetchLongTermStocks().then((value) => setState(() {
    //   longTermStockList = value;
    // }));

    _screens = [
      HomePageScreen(),
      MarketHarshilScreen(),
      PortfolioScreen(username: username),
      ProfileScreen(user : widget.userData)
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
