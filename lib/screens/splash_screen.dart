import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, "/"),
    );
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(
          child: Image(
            image: AssetImage("assets/images/logo.png"),
            width: 125,
            height: 125,
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          color: Colors.black,
          child: Text(
            "Zero To Unicorn",
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        )
      ]),
    );
  }
}
