import 'package:flutter/material.dart';
import 'package:flutter_project/StartupScreen.dart';
import 'package:flutter_project/provider/provider_chargers.dart';
import 'package:provider/provider.dart';

class ChargerList extends StatefulWidget {
  const ChargerList({super.key});

  @override
  State<ChargerList> createState() => _ChargerListState();
}

class _ChargerListState extends State<ChargerList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ChargerProvider>(context, listen: false).getAllChargers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ChargerProvider>(
        builder: (context, value, child) {
          final chargers = value.chargers;
          return ListView.builder(
            itemCount: chargers.length,
            itemBuilder: (context, index) {
              final charger = chargers[index];
              return GestureDetector(
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => StartUp()));
                  print('Clicked on charger with ID: ${charger.location}');
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(charger.id.toString()),
                  ),
                  title: Text(
                    charger.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
