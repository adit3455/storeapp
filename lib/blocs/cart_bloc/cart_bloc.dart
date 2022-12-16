import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:storeapp/models/export_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onCartStart);
    on<CartProductAdded>(_onAddCartProduct);
    on<CartProductRemoved>(_onRemovedCartProduct);
  }

  void _onCartStart(CartStarted event, Emitter<CartState> emit) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (e) {
      e.toString();
    }
  }

  void _onAddCartProduct(CartProductAdded event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      emit(CartLoaded(
          cart: CartModel(
              products: List.from(state.cart.products)..add(event.product))));
    }
  }

  void _onRemovedCartProduct(
      CartProductRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      emit(CartLoaded(
          cart: CartModel(
              products: List.from(state.cart.products)
                ..remove(event.product))));
    }
  }
}
