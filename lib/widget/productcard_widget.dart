import 'package:flutter/material.dart';
import '../blocs/export_blocs.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product products;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;
  const ProductCard({
    this.leftPosition = 3.0,
    this.widthFactor = 2.5,
    this.isWishlist = false,
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, '/product', arguments: products),
      child: Stack(
        children: [
          SizedBox(
            width: widthValue,
            height: 150,
            child: Image.network(
              products.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              width: widthValue - 10 - leftPosition,
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(color: Colors.black),
              width: widthValue - 10 - leftPosition,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          Product.products[0].price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(products));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Add Product to Cart")));
                        },
                        icon:
                            const Icon(Icons.add_circle, color: Colors.white)),
                  ),
                  isWishlist
                      ? Expanded(
                          child: IconButton(
                              onPressed: () {
                                context
                                    .read<WishlistBloc>()
                                    .add(RemoveWishlistProduct(products));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Remove Product from Wishlist")));
                              },
                              icon: const Icon(Icons.delete,
                                  color: Colors.white)),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
