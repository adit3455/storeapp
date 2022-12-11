import 'package:flutter/material.dart';

import '../widget/export_widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Wishlist Screen"),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Container());
  }
}
