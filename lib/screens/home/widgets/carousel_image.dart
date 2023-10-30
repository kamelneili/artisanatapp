import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              i,
              fit: BoxFit.cover,
              height: 150,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        height: 150,
      ),
    );
  }
}
