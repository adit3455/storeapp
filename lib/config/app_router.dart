import 'package:flutter/material.dart';
import 'package:storeapp/models/export_model.dart';
import '../screens/export_screens.dart';
import '../widget/export_widgets.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: HomeScreen.routeName),
            builder: (context) => const HomeScreen());
      case '/cart':
        return MaterialPageRoute(
            settings: const RouteSettings(name: CartScreen.routeName),
            builder: (context) => const CartScreen());
      case '/catalog':
        return MaterialPageRoute(
            settings: const RouteSettings(name: CatalogScreen.routeName),
            builder: (context) => CatalogScreen(
                  category: settings.arguments as Category,
                ));
      case '/product':
        return MaterialPageRoute(
            settings: const RouteSettings(name: ProductScreen.routeName),
            builder: (context) => ProductScreen(
                  product: settings.arguments as Product,
                ));
      case '/wishlist':
        return MaterialPageRoute(
            settings: const RouteSettings(name: WishlistScreen.routeName),
            builder: (context) => const WishlistScreen());
      case '/splash':
        return MaterialPageRoute(
            settings: const RouteSettings(name: SplashScreen.routeName),
            builder: (context) => const SplashScreen());

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: CustomAppBar(title: "Error", isFavoriteIcon: false),
        body: Center(
          child: Text(
            "Theres Something Error",
            style: Theme.of(_).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
