import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';

class OrderSummaryProductCard extends StatelessWidget {
  final int quantity;
  final Product product;
  const OrderSummaryProductCard({
    required this.quantity,
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Qty :  $quantity",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "\$${product.price}",
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        ],
      ),
    );
  }
}
