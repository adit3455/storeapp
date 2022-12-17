import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/config/app_router.dart';
import 'package:storeapp/config/theme.dart';
import 'package:storeapp/repository/category/category_repository.dart';
import 'package:storeapp/repository/product/product_repository.dart';
import 'package:storeapp/screens/export_screens.dart';

import 'blocs/export_blocs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => WishlistBloc()..add(StartWishlist())),
      BlocProvider(create: (context) => CartBloc()..add(CartStarted())),
      BlocProvider(
          create: (context) =>
              CategoryBloc(categoryRepository: CategoryRepository())
                ..add(LoadCategories())),
      BlocProvider(
        create: (context) =>
            ProductsBloc(productRepository: ProductRepository())
              ..add(LoadProducts()),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      theme: theme(),
    ),
  ));
}
