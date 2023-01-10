import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storeapp/models/export_model.dart';
import 'package:storeapp/widget/export_widgets.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const routeName = '/order';
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Order Confirmation",
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: 300,
              ),
              Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset('assets/svgs/garlands.svg')),
              Positioned(
                top: 250,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Your Order is Complete",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ORDER CODE : 1232",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Thank you for purchasing on Zero to Unicorn",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "ORDER CODE : 1232",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const OrderSummary(),
                const SizedBox(height: 20.0),
                Text(
                  "ORDER DETAILS",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 5),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OrderSummaryProductCard(
                      product: Product.products[0],
                      quantity: 2,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
