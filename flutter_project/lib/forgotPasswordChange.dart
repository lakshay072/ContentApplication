import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_project/forgotPasswordLogin.dart';

class ForgotPasswordChange extends StatefulWidget {
  const ForgotPasswordChange({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordChange> createState() => _ForgotPasswordChangeState();
}

class _ForgotPasswordChangeState extends State<ForgotPasswordChange> {
  TextEditingController _newpassword = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Container(
                    child: Text(
                      'New Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                controller: _newpassword,
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
                  hintText: 'New Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Container(
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _confirmpassword,
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
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(
                child: Text(
                  'Change Password',
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ForgotPasswordLoginScreenLink()));
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
