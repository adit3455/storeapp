import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/"),
              icon: const Icon(Icons.home, color: Colors.white)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: const Icon(Icons.shopping_cart, color: Colors.white)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/"),
              icon: const Icon(Icons.person, color: Colors.white)),
        ],
      ),
    );
  }
}
