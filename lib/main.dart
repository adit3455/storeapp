import 'package:flutter/material.dart';
import 'package:storeapp/config/app_router.dart';
import 'package:storeapp/config/theme.dart';

import 'screens/home_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      theme: theme(),
    ));
