import 'package:flutter/material.dart';
import 'package:share/share.dart';

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
      backgroundColor: Colors.purple.shade300,
      leading: Container(
        width: MediaQuery.of(context).size.height * 0.2,
        height: 50,
        child: Image.asset(
          'assets/logo.png',
          //fit: BoxFit.fitHeight,
        ),
      ),
      leadingWidth: 40,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Content Application",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Newyork',
            ),
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.mobile_screen_share),
          color: Colors.white,
          onPressed: () {
            _shareApplication('Check this out!');
          },
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
  List<Widget> buildSuggestions(BuildContext context) {}

}*/

//Share Application
void _shareApplication(String content) {
  Share.share(content);
}