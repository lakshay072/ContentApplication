import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ChargerList with ChangeNotifier {
  chargers() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };
    http.Response response = await http.get(
        Uri.parse('http://dev.rimone.online:3000/api/chargers'),
        headers: headers);
    var mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      print("THE RESPONSE BODY IS ${response.body}");
      print("THE MAP RESPcONSE BODY IS ${mapResponse}");
    }
    return response;
  }
}