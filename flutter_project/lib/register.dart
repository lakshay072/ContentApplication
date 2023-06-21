import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/dashboard.dart';

import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  //TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade300,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          color: Colors.yellow.shade300,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                  child: Text(
                    'Register yourself with Rimone',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.yellow)),
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.yellow.shade100,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.yellow)),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.yellow.shade100,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.yellow)),
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.yellow.shade100,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.yellow)),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.yellow.shade100,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ElevatedButton(
                    onPressed: () {
                      registeruser();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade700,
                        side: BorderSide(color: Colors.black12, width: 6),
                        minimumSize: Size(150, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void registeruser() async {

    final url = 'http://dev.rimone.online:3000/api/users';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf'
    };
    final body = jsonEncode({
      //"guid": username.text,
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "password": password.text,
    });

    http.post(Uri.parse(url), headers: headers, body: body).then((response) {
      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if ('id' != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DashboardScreen(userID: jsonResponse['id'])),
          );
        } else {
          print('Authentication failed.');
          // Show error message on screen
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content:
                    Text('Invalid Username or Password. Please try again.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    });
  }
}

