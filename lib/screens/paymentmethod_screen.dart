import 'package:flutter/material.dart';
import 'package:storeapp/widget/custom_appbar.dart';
import 'package:storeapp/widget/custom_bottomnavigationbar.dart';

class PaymentMethodScreen extends StatelessWidget {
  static const routeName = '/payment';
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Payment Method",
        isFavoriteIcon: false,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
