import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/forgotPasswordChange.dart';
import 'package:http/http.dart' as http;

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();

  bool showOtpField = false;
  TextEditingController _phone = TextEditingController();
  TextEditingController _passOTP = TextEditingController();

  void getOtp() {
    // api url
    final url = 'http://dev.rimone.online:3000/api/users/otp-verify';
    //api headers, with auth token
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
      'phone': _phone.text,
    };
    http.get(Uri.parse(url), headers: headers).then((response) {
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if ('opt' != null) {
          print("OK");
        }
      }
    });
    setState(() {
      showOtpField = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade300,
          title: Text('Reset Password'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            color: Colors.yellow.shade300,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/rwr-nobg.png'))),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      child: Text(
                        "Hey User,\nWe all forget things, Don't worry we've got you covered. ",
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      obscureText: true,
                      controller: _phone,
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
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Visibility(
                    visible: showOtpField,
                    child: TextField(
                      controller: _passOTP,
                      keyboardType: TextInputType.number,
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
                        hintText: 'Enter OTP',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ElevatedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade700,
                        side: BorderSide(color: Colors.black12, width: 6),
                        minimumSize: Size(120, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: () {
                      getOtp();
                      if(_passOTP != null)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPasswordChange())
                          );
                        }
                      else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content:
                              Text('Try Again'),
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
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
