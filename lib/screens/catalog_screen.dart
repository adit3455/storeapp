import 'package:flutter/material.dart';

import '../models/export_model.dart';
import '../widget/export_widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  final Category category;

  const CatalogScreen({required this.category, super.key});
  @override
  Widget build(BuildContext context) {
    final List<Product> productCategory = Product.products
        .where(
          (product) => product.category == category.name,
        )
        .toList();

    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: GridView.builder(
          itemCount: productCategory.length,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => Center(
            child: ProductCard(
              widthFactor: 2.2,
              products: productCategory[index],
            ),
          ),
        ));
  }
}
