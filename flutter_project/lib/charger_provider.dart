import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Charger {
  final int id;
  final int location;
  final String name;
  final String type;
  final int oem;
  final String serialId;
  final bool available;
  final int minBalance;

  Charger({
    required this.id,
    required this.location,
    required this.name,
    required this.type,
    required this.oem,
    required this.serialId,
    required this.available,
    required this.minBalance,
  });
}

class ChargerProvider extends ChangeNotifier{

  final chargerID;
  ChargerProvider({Key? key, required this.chargerID});

  List<Charger> chargerList = [];

  chargerlist() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };
    http.Response response = await http.get(
      Uri.parse('http://dev.rimone.online:3000/api/chargers/$chargerID'),
      headers: headers,
    );
    var mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      print("THE RESPONSE BODY IS ${response.body}");
      print("THE MAP RESPONSE BODY IS ${mapResponse}");

      // Parse the response and store charger data in chargerList
      chargerList = (mapResponse as List)
          .map((item) => Charger(
        id: item['id'],
        location: item['location'],
        name: item['name'],
        type: item['type'],
        oem: item['oem'],
        serialId: item['serialId'],
        available: item['available'],
        minBalance: item['minBalance'],
      ))
          .toList();
    }

    return response;
  }



}