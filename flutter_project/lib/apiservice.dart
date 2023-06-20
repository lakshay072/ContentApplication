/*
import 'package:http/http.dart' as http;

class APIService{
  static var client = http.Client();

  static Future<dynamic> getUser(email, pass) async{
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'email': email,
      'password': pass
    };

    var url = 'http://3.229.255.54:3000/api';
    var response = await http.get(Uri.parse('http://3.229.255.54:3000/api/user'));

    //var response = await client.get('http://3.229.255.54:3000/api/user', headers: requestHeaders  )

    if(response.statusCode == 200){
      print(response.body);
    }
    else
    {
      return null;
    }
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> login(String email, String password) async {
  final url = Uri.parse('https://api.example.com/login');
  final headers = <String, String>{'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});
  final response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    // Process the response
  } else {
    throw Exception('Failed to login');
  }
}
*/
