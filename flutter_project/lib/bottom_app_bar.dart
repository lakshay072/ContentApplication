import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.yellow.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.pin_drop_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.electric_car_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget? get child => null;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
