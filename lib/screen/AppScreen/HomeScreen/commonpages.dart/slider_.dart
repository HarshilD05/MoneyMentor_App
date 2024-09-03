import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class SliderWidget extends StatelessWidget {
  final List<String> sliderImagesStrList;

  SliderWidget(
      {super.key, required this.sliderImagesStrList});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        items: sliderImagesStrList
            .map((image) => Container(
                  child: Center(
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // Ensures image fills container
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          height: 100.0, // Adjust height as needed
          enlargeCenterPage: true, // Highlight the current image
          viewportFraction: 0.8, // Adjust image visibility within slider
          enableInfiniteScroll: true, // Loop through images
          onPageChanged: (index, reason) {
            // print('Image at index $index tapped');
            // Add your custom tap functionality here
            // For example, navigate to a new screen, display information, etc.
          },
        ),
      ),
    );
  }
}
