import 'package:flutter/material.dart';

import '../widget/export_widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  const CatalogScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Catalog Screen"),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Container());
  }
}
