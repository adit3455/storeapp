import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isFavoriteIcon;
  final bool isBackward;

  CustomAppBar({
    this.isBackward = true,
    required this.title,
    this.isFavoriteIcon = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: isBackward
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back))
          : const SizedBox(),
      title: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white)),
      ),
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        isFavoriteIcon
            ? IconButton(
                onPressed: () => Navigator.pushNamed(context, "/wishlist"),
                icon: const Icon(Icons.favorite))
            : const SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
