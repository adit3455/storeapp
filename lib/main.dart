import 'package:flutter/material.dart';
import 'package:storeapp/config/app_router.dart';
import 'package:storeapp/config/theme.dart';

import 'blocs/export_blocs.dart';
import 'screens/home_screen.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WishlistBloc()..add(StartWishlist()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
        theme: theme(),
      ),
    ));
