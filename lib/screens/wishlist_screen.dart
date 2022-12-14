import 'package:flutter/material.dart';

import '../blocs/export_blocs.dart';
import '../widget/export_widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Wishlist"),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is WishlistLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WishlistLoaded) {
              return GridView.builder(
                itemCount: state.wishlist.products.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.2),
                itemBuilder: (context, index) => Center(
                  child: ProductCard(
                    widthFactor: 1.1,
                    leftPosition: 100.0,
                    isWishlist: true,
                    products: state.wishlist.products[index],
                  ),
                ),
              );
            } else {
              return const Text("Theres Something Wrong");
            }
          },
        ));
  }
}
