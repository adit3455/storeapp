import 'package:flutter/material.dart';
import 'package:storeapp/config/app_router.dart';
import 'package:storeapp/config/theme.dart';
import 'package:storeapp/screens/export_screens.dart';

import 'blocs/export_blocs.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (context) => CartBloc()..add(CartStarted()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        theme: theme(),
      ),
    ));
