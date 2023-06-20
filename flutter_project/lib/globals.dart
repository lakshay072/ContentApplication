import 'package:http/http.dart' as http;
import 'dart:convert';

var id;
var _location;
var _name;
var _type;
var _oem;
var _serialID;
var _available;
var _minBalance;

  var lurl = 'http://dev.rimone.online:3000';
  //var prod_url = 'http://www.rimone.online:3000';

 class ChargerGlobals {
  final String chargerID;

  ChargerGlobals({required this.chargerID});
/*
  static ChargerGlobals create(String chargerID) {
    return ChargerGlobals(chargerID);
  }*/

  static var id;
  static var _location;
  static var name;
  static var _type;
  static var _oem;
  static var _serialID;
  static var _available;
  static var _minBalance;


  static var chargers = [];


  //static String get name => _name;

  static Future<void> ChargerInfo(chargerID) async {
    final url = '$lurl/api/chargers/$chargerID';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };

    //final response = await http.get(Uri.parse(url));

    http.get(Uri.parse(url), headers: headers).then((response) {
      final data = jsonDecode(response.body);

    for(int i=0; i<data.length; i++)
      {
        chargers.add(data[i]);
      }
      print(response.body);
      print(id);

    });
  }

}
