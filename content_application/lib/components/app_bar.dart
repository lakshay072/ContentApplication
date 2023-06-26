import 'package:flutter/material.dart';

class ContentAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ContentAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ContentAppBarState createState() => ContentAppBarState();
}

class ContentAppBarState extends State<ContentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple.shade400,
      leading: Container(
        width: 20,
        height: 20,
        child: Image.asset(
          'assets/logo.png',
          //fit: BoxFit.fitHeight,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(),
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.08,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.access_time_filled),
          color: Colors.white,
          onPressed: () { },
        ),
      ],
    );
  }
}

/*class CustomSearchDelegate extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {}

  @override
  List<Widget> buildLeading(BuildContext context) {}

  @override
  List<Widget> buildResults(BuildContext context) {}

  @override
  List<Widget> buildSUggestions(BuildContext context) {}

}*/
