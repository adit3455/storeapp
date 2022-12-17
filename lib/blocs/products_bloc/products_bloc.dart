import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storeapp/models/export_model.dart';
import 'package:storeapp/repository/product/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productsSubscription;

  ProductsBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductsLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductsState> emit) {
    _productsSubscription?.cancel();
    _productsSubscription = _productRepository
        .getAllProducts()
        .listen((products) => add(UpdateProducts(products: products)));
  }

  _onUpdateProducts(UpdateProducts event, Emitter<ProductsState> emit) {
    emit(ProductsLoaded(products: event.products));
  }
}
