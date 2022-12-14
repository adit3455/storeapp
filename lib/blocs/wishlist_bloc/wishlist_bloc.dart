import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storeapp/models/export_model.dart';
import 'package:storeapp/models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_onStartWishlist);
    on<AddWishlistProduct>(_onAddWishlist);
    on<RemoveWishlistProduct>(_onRemoveWishlist);
  }

  _onStartWishlist(StartWishlist event, Emitter<WishlistState> state) async {
    WishlistLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(const WishlistLoaded());
    } catch (e) {
      e.toString();
    }
  }

  _onAddWishlist(AddWishlistProduct event, Emitter<WishlistState> state) {
    final state = this.state;
    if (state is WishlistLoaded) {
      emit(WishlistLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..add(event.product))));
    }
  }

  _onRemoveWishlist(RemoveWishlistProduct event, Emitter<WishlistState> state) {
    final state = this.state;
    if (state is WishlistLoaded) {
      emit(WishlistLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product))));
    }
  }
}
