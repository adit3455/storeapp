// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../blocs/export_blocs.dart';
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
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.cart.freeDeliveryString,
                                style: Theme.of(context).textTheme.headline5),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder()),
                                onPressed: () =>
                                    Navigator.pushNamed(context, "/"),
                                child: const Text("Add More Product"))
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          height: 350,
                          child: ListView.builder(
                            itemCount: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                product: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .elementAt(index),
                                quantity: state.cart
                                    .productQuantity(state.cart.products)
                                    .values
                                    .elementAt(index),
                              );
                            },
                          ),
                        )
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("SUBTOTAL",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  Text("\$${state.cart.subTotalString}",
                                      style:
                                          Theme.of(context).textTheme.headline5)
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("DELIVERY FEE",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  Text("\$${state.cart.deliveryFeeString}",
                                      style:
                                          Theme.of(context).textTheme.headline5)
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
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50)),
                            ),
                            Container(
                              height: 60,
                              margin: const EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  const BoxDecoration(color: Colors.black),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("TOTAL",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.white)),
                                    Text("\$${state.cart.totalString}",
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
              );
            } else {
              return const Text("Theres Something Wrong");
            }
          },
        ));
  }
}
