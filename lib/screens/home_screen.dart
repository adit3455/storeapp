import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../blocs/export_blocs.dart';
import '../widget/export_widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Zero To Unicorn"),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 2,
                      autoPlay: true,
                    ),
                    items: state.categories
                        .map((e) => HeroCarouselCard(category: e))
                        .toList(),
                  );
                } else {
                  return const Text("Theres Something Wrong");
                }
              },
            ),
            const SectionTitle(title: "RECOMENDED"),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProductsLoaded) {
                  return SizedBox(
                      height: 165,
                      child: ProductCarousel(
                          products: state.products
                              .where((element) => element.isRecomended)
                              .toList()));
                } else {
                  return const Text("Theres Something Wrong");
                }
              },
            ),
            const SectionTitle(title: "MOST POPULAR"),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProductsLoaded) {
                  return SizedBox(
                      height: 165,
                      child: ProductCarousel(
                          products: state.products
                              .where((element) => element.isPopular)
                              .toList()));
                } else {
                  return const Text("Theres Something Wrong");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
