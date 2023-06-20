/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/utils.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {

  final List<String> images = [
    'assets/car.png'
    'assets/current_location.png'
  ];

  List<Widget> generateImage(){
    return images.map((element) =>ClipRRect(
      child: Image.asset(element,
      fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(15),
    ) ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        children: [
          CarouselSlider(items: generateImage(),
              options: CarouselOptions(
                enlargeCenterPage: false,
              ))
        ],
      ),
    );
  }
}
*/
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project/homepage.dart';
import 'package:flutter_project/login.dart';

class StartUp extends StatefulWidget {
  @override
  StartUpState createState() => StartUpState();
}

class StartUpState extends State<StartUp> {
  int _imageIndex = 1;
  int _headingtextIndex = 1;
  int _descriptiontextIndex = 1;

  final List<String> _imagePaths = [
    'assets/current_location.png',
    'assets/car.png',
    'assets/car_driving.png',

  ];

  final List<String> _descriptiontext = [
    'Find the nearest Charging Station',
    'Charge your EV at Rimone Charging Station',
    'Hit the road with the full charge',
  ];

  final List<String> _headingtext = [
    'Locate',
    'Charge',
    'Ready Go',
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      setState(() {
        _imageIndex = (_imageIndex + 1)% _imagePaths.length;
        _headingtextIndex = (_headingtextIndex + 1)% _headingtext.length;
        _descriptiontextIndex = (_descriptiontextIndex + 1)% _descriptiontext.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow.shade300,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(40, 30),
                      backgroundColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard(userID: 1)));
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/rwr-nobg.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
              /*height: 200,
                height: MediaQuery.of(context).size.height * 0.02,
                color: Colors.black,*/
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_imagePaths[_imageIndex]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                _headingtext[_headingtextIndex],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 50),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                _descriptiontext[_descriptiontextIndex],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
            ),
/*            Container(
                decoration: BoxDecoration(),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Charge',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 60),
                )),
            Container(
                decoration: BoxDecoration(),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Charge your EV at Rimone Charging Station',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                )),*/
            /*ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Skip',km
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),*/
            SizedBox(height:MediaQuery.of(context).size.height * .03 ),
            ElevatedButton(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black12, width: 6),
                  ),
                  minimumSize: Size(300, 45)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
