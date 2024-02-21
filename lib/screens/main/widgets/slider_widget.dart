import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget({super.key, required this.pages, required this.height});
  List<Widget> pages;
  double height;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: pages.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: pages[index],
          );
        },
        options: CarouselOptions(
          aspectRatio: 10/5,
            height: height,
            autoPlay: true,
            viewportFraction: .9,
            autoPlayInterval: const Duration(seconds: 2)));
  }
}
