// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'export_model.dart';

class CartModel extends Equatable {
  final List<Product> products;
  const CartModel({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subTotalString => subTotal.toStringAsFixed(2);

  double deliveryFee(subTotal) {
    if (subTotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  String freeDelivery(subTotal) {
    if (subTotal >= 30.00) {
      return "Your delivery is Free!";
    } else {
      double missing = 30.00 - subTotal;
      return "Add \$${missing.toStringAsFixed(2)} for Free Delivery!";
    }
  }

  String get freeDeliveryString => freeDelivery(subTotal);

  double total(subTotal, deliveryFee) => subTotal + deliveryFee(subTotal);
  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);
}
