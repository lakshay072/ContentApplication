import 'package:flutter/material.dart';
import 'package:flutter_project/ChargerList.dart';
import 'package:flutter_project/ChargerPage.dart';
import 'package:flutter_project/ConnectChargerScreen.dart';
import 'package:flutter_project/Dashboard.dart';
import 'package:flutter_project/MapScreen.dart';
import 'package:flutter_project/OtpLogin.dart';
import 'package:flutter_project/OtpPage.dart';
import 'package:flutter_project/ProfileDrawer.dart';
import 'package:flutter_project/Filter.dart';
import 'package:flutter_project/StartupScreen.dart';
import 'package:flutter_project/charger_provider.dart';
import 'package:flutter_project/login.dart';
import 'package:flutter_project/pincode_location.dart';
import 'package:flutter_project/qrCode.dart';
import 'package:flutter_project/Filter.dart';
import 'package:flutter_project/test.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ChargerProvider(chargerID: 2))
        ],
        child: Scaffold(
          body: StartUp(),
        ),
      ),
    );
  }
}

