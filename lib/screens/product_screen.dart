import 'package:flutter/material.dart';

import '../widget/export_widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Product Screen"),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Container());
  }
}
