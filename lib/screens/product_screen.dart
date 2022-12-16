// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../blocs/export_blocs.dart';
import '../models/export_model.dart';
import '../widget/export_widgets.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  static const String routeName = '/product';

  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Colors.white)),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          context
                              .read<WishlistBloc>()
                              .add(AddWishlistProduct(product));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Added to your wishlist")));
                        },
                        icon: const Icon(Icons.favorite, color: Colors.white));
                  },
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                      Navigator.of(context).pushNamed("/cart");
                    },
                    child: Text(
                      "ADD TO CART",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: [HeroCarouselCard(product: product)]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black.withAlpha(50),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white)),
                          Text("${product.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ExpansionTile(
                title: Text(
                  "Product Information",
                  style: Theme.of(context).textTheme.headline3,
                ),
                initiallyExpanded: true,
                children: [
                  ListTile(
                    title: Text(
                      "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius totam accusantium consequuntur nostrum nihil non asperiores consequatur nam delectus tempore?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ExpansionTile(
                title: Text(
                  "Delivery Information",
                  style: Theme.of(context).textTheme.headline3,
                ),
                initiallyExpanded: true,
                children: [
                  ListTile(
                    title: Text(
                      "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius totam accusantium consequuntur nostrum nihil non asperiores consequatur nam delectus tempore?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
