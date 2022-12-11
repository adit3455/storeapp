import 'package:flutter/material.dart';

import '../widget/export_widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Cart Screen"),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Container());
  }
}
