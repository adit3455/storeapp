import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/export_model.dart';
import '../widget/export_widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Zero To Unicorn"),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: true,
            ),
            items: Category.categories
                .map((e) => HeroCarouselCard(category: e))
                .toList(),
          ),
          const SectionTitle(title: "RECOMENDED")
        ],
      ),
    );
  }
}
