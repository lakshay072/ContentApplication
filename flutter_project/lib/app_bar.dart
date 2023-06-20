import 'package:flutter/material.dart';
import 'package:flutter_project/ChargerList.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar>  {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow.shade300,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
            const EdgeInsets.only(),
            child: Container(
              height: MediaQuery.of(context).size.width * .12,
              width: MediaQuery.of(context).size.width * .4,
              //color: Colors.black12,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/rwr-nobg.png'),
                  )),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.black,
          onPressed: () {
            //SearchBar();
          },
        ),
        IconButton(
          icon: Icon(Icons.ev_station),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChargerList()),
            );
          },
        ),
      ],
    );
  }

}
