/*
import 'package:flutter/material.dart';
import 'package:flutter_project/globals.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  //final _name = ChargerGlobals.name;

  @override
*//*

*/
/* void initState() {
    super.initState();
    ChargerGlobals.ChargerInfo(chargerID);
    print(ChargerGlobals.chargers);
  }*//*
*/
/*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200,),
          Center(
            child: Container(
              height: 100,
              width: 50,
              child: Text('${ChargerGlobals.id}'),
            ),
          ),

          Center(
            child: Container(
              height: 100,
              width: 50,
              child: Text('Hello'),
            ),
          ),
        ],
      ),
    );
  }
}
*//*


*/
/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chargersProvider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Consumer<ChargerProvider>(
          builder: (context, chargerProvider, _) {
            // Access the ID of the first charger
             var chargerId = chargerProvider.chargerList.isNotEmpty
                ? chargerProvider.chargerList[0].oem
                : 0; // Provide a default value if chargerList is empty

            return Container(
              child: Text(
                chargerId.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}*//*

import 'package:flutter/material.dart';
import 'package:flutter_project/provider/provider_chargers.dart';
import 'package:provider/provider.dart';

import 'chargersProvider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Consumer<ChargerProvider>(
          builder: (context, chargerProvider, value) {
            // Access the name of the first charger
            final String chargerName = chargerProvider.chargerList.isNotEmpty
                ? chargerProvider.chargerList[0].name
                : 'Unknown Charger'; // Provide a default value if chargerList is empty

            return Container(
              child: Text(
                chargerName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

*/
