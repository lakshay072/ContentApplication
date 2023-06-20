import 'package:flutter/material.dart';
import 'package:flutter_project/Dashboard.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(200.0), // here the desired height
        child: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('My Account',
              style: TextStyle(
              ),
        ),
          centerTitle: true,
      ),
    ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "UserName",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              //controller: _username,
              decoration: InputDecoration(
              hintText: "UserName",
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Name",
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      TextFormField(
        //controller: _nameController,
        decoration: InputDecoration(
          hintText: "Name",
        ),
      ),
            SizedBox(height: 15),
      Text(
        "Email",
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      TextFormField(
        //controller: _nameController,
        decoration: InputDecoration(
          hintText: "Email",
        ),
      ),
            SizedBox(height: 15),
            Text(
              "Password",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
        //controller: _nameController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
