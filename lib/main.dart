import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/config/app_router.dart';
import 'package:storeapp/config/theme.dart';
import 'package:storeapp/screens/export_screens.dart';
import 'blocs/export_blocs.dart';
import 'repository/export_repositories.dart';

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
      ),
      BlocProvider(
        create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository()),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: OrderConfirmationScreen.routeName,
      theme: theme(),
    ),
  ));
}
