import 'package:flutter/material.dart';
import 'package:moneymentor/utils/constants/fontstyles.dart';
import 'package:moneymentor/utils/constants/image_strings.dart';

class TradeIdeas extends StatefulWidget {
  const TradeIdeas({super.key});

  @override
  State<TradeIdeas> createState() => TradeIdeasState();
}

class TradeIdeasState extends State<TradeIdeas> {
  String defaultimage = TImages.banner_tradeidea_1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 37, 37),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Trade idea",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      defaultimage = TImages.banner_tradeidea_1;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text("Short"),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 60),
                  ),
                  onPressed: () {
                    setState(() {
                      defaultimage = TImages.banner_tradeidea_2;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text("Medium"),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(80, 70),
                  ),
                  onPressed: () {
                    setState(() {
                      defaultimage = TImages.banner_tradeidea_3;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text("Long"),
                  ))
            ],
          ),
          const SizedBox(height: 10),
          Image.asset(defaultimage)
        ],
      ),
    );
  }
}
