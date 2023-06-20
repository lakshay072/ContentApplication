import 'package:flutter/material.dart';
import 'package:flutter_project/Dashboard.dart';
import 'package:flutter_project/ForgotPasswordAuthentication.dart';
import 'package:flutter_project/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController authController = TextEditingController();
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Colors.yellow.shade300,
            ),
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/rwr-nobg.png'))),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      child: Text(
                        'Phone Number/Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
                  child: TextField(
                    cursorColor: Colors.yellow.shade300,
                    controller: nameController,
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
                      hintText: 'Phone Number/Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.yellow.shade100,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
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
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow.shade700,
                          side: BorderSide(color: Colors.black12, width: 6),
                          minimumSize: Size(150, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),

                      onPressed: () {
                        login();
                        // Call backend service to verify OTP
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow.shade700,
                          side: BorderSide(color: Colors.black12, width: 6),
                          minimumSize: Size(150, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {
                        //forgot password screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PasswordResetScreen()),
                        );
                      },
                    ),
                  ],
                ),
/*                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )),

                TextButton(
                  onPressed: () {
                    //forgot password screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PasswordResetScreen()),
                    );
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),*/
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Not an existing user?',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                    )
                  ],
                ),
              ],
            )));
  }

  void login() async {
    final url = 'http://dev.rimone.online:3000/api/users/login';
    final headers = {
      'Content-Type': 'application/json',
      "email": nameController.text,
      "password": passwordController.text,
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };

    http.get(Uri.parse(url), headers: headers).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (jsonResponse['auth'] == true) {
          Navigator.push(
            context,
            //getuserdetails();
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
        // Show error message on screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content:
                  Text('Request failed with status: ${response.statusCode}.'),
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
    });
  }
}
