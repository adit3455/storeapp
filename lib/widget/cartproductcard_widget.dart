import 'package:flutter/material.dart';

import '../blocs/export_blocs.dart';
import '../models/export_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    Key? key,
    required this.quantity,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          product.imageUrl,
          width: 100,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "${product.price}",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10.0),
        Row(
          children: [
            IconButton(
                onPressed: () =>
                    context.read<CartBloc>().add(CartProductRemoved(product)),
                icon: const Icon(Icons.remove_circle)),
            Text(
              "$quantity",
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
                onPressed: () =>
                    context.read<CartBloc>().add(CartProductAdded(product)),
                icon: const Icon(Icons.add_circle)),
          ],
        )
      ],
    );
  }
}
