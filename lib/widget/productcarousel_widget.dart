import 'package:flutter/material.dart';

import '../models/export_model.dart';
import 'export_widgets.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      itemCount: products.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: ProductCard(products: products[index]),
        );
      },
    );
  }
}
