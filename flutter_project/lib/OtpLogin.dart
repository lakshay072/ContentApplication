import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/OtpPage.dart';
import 'package:http/http.dart' as http;

class OtpLogin extends StatefulWidget {
  @override
  OtpLoginState createState() => OtpLoginState();
}

class OtpLoginState extends State<OtpLogin> {
  TextEditingController _phone = TextEditingController();

  //Function to check the phone number
  String errorText = 'Ok';
  bool isButtonEnabled = false;

  void validateInput(String input) {
    setState(() {
      if (!['6', '7', '8', '9'].contains(input[0])) {
        errorText = 'Input must be 10 digits';
      } else if (input.length != 10) {
        errorText = 'First digit must be 6, 7, 8, or 9';
      } else {
        errorText = 'Don;t know';
        isButtonEnabled = true;
      }
    });
  }

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
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpVerificationPage(
                    gen_OTP: jsonResponse['opt'],
                    UserPhone: jsonResponse['phone'])),
          );
        }
      }
    });
  }

  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  final RegExp mobileRegex = RegExp(r'^[6-9]\d{9}$');

  @override
  void initState() {
    super.initState();

    _phone.addListener(() {
      if (_phone.text.length == 10) {
        getOtp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.yellow.shade300,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
/*            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome to',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                )),

            SizedBox(height: MediaQuery.of(context).size.height * 0),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Rimone EV',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 40),
                )),*/
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/rwr-nobg.png'))),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/electric_car.png'),
                fit: BoxFit.scaleDown,
              )),
              //color: Colors.black,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

//            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: TextFormField(
/*                  onChanged: (value) {
                    if (value.length > 10) {
                      // input string is too long, truncate it to 10 characters
                      value = value.substring(0, 10);
                      phone.text = value;
                    }
                    if (mobileRegex.hasMatch(value)) {
                      // valid mobile number
                      if (['1', '2', '3', '4', '5'].contains(value[0])) {
                        // show red pop-up box
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Invalid number'),
                              content: Text(
                                  'Phone number should not start with 1, 2, 3, 4, or 5'),
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
                      // invalid mobile number
                    }
                  },*/
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  //maxLength: 10,
                  onChanged: (input) => validateInput(input),
                  controller: _phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.yellow)),
                    hintText: 'Enter 10 digits',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(140, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    getOtp();
                    // Call backend service to verify OTP
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(140, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    getOtp();
                    // Call backend service to verify OTP
                  },
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade400,
                      minimumSize: Size(150, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Text(
                    'Skip for now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
