// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:storeapp/models/export_model.dart';

import '../widget/export_widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Cart"),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Text(
                      "GO TO CHECKOUT",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Add \$20.00 for FREE Delivery",
                          style: Theme.of(context).textTheme.headline5),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              elevation: 0,
                              shape: const RoundedRectangleBorder()),
                          onPressed: () => Navigator.pushNamed(context, "/"),
                          child: const Text("Add More Product"))
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  CartProductCard(product: Product.products[0]),
                  CartProductCard(product: Product.products[0]),
                ],
              ),
              Column(
                children: [
                  const Divider(thickness: 2.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("SUBTOTAL",
                                style: Theme.of(context).textTheme.headline5),
                            Text("\$5.98",
                                style: Theme.of(context).textTheme.headline5)
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("DELIVERY FEE",
                                style: Theme.of(context).textTheme.headline5),
                            Text("\$5.98",
                                style: Theme.of(context).textTheme.headline5)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Stack(
                    children: [
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            BoxDecoration(color: Colors.black.withAlpha(50)),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("TOTAL",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white)),
                              Text("\$5.98",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
