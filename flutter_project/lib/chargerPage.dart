import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_project/chargerList.dart';
import 'package:flutter_project/chargerPage.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class ChargerScreen extends StatefulWidget {
  var chargerID;

  ChargerScreen({Key? key, required this.chargerID}) : super(key: key);


  //userID = userID;
  @override
  _ChargerScreenState createState() => _ChargerScreenState();

}


class _ChargerScreenState extends State<ChargerScreen> {
  get chargerID => ChargerScreen(chargerID: chargerID);


  @override
  void initState() {
    super.initState();
    _fetchUserData();}
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  var _name;
  var _serialID;
  var _powerRating;
  var _pricePerUnit;
  var _pricePerMinute;
  var _longitute;
  var _latitute;
  var _socketType;
  var _available;

  //get userID => DashboardScreen(userID: userID);
  Future<void> _fetchUserData() async {
    print("Charger ID is#################%%%%%%%%%%%: ${chargerID}");

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };

    final response = await http.get(
        Uri.parse('http://dev.rimone.online:3000/api/chargers/${chargerID}'),
        headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        _name = data['name'];
        _serialID = data['serialID'];
        _powerRating = data['powerRating'];
        _pricePerUnit = data['pricePerUnit'];
        _pricePerMinute = data['pricePerMinute'];
        _longitute = data['longitute'];
        _latitute = data['latitute'];
        _socketType = data['socketType'];
        _available = data['available'];
      });
    } else {
      throw Exception('Failed to fetch user data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Charger'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                carouselController: _carouselController,
                items: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/electric_car.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/car_driving.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/car.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                    height: 250,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 0.5 / 0.5,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 100),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    })),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width:  MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Colors.yellow.shade300,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(child: Text('sssss'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChargerList()));
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/ammenities/restroom_fill.png'))),
                    // color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/ammenities/store_fill.png'))),
                    // color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/ammenities/coffee_fill.png'))),
                    // color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/ammenities/sleeping_fill.png'))),
                    // color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/ammenities/car_wash_fill.png'))),
                    // color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/ammenities/photo_booth_fill.png'))),
                    // color: Colors.black12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/ammenities/animal_care_fill.png'))),
                    // color: Colors.black12,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.yellow.shade300,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username field
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Name of Charger: $_name',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // Name field
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Serial ID: $_serialID',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // Email field
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Power Rating (Volts): $_powerRating',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // Phone field
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Price Per Unit: $_pricePerUnit',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Price Per Minute: $_pricePerMinute',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Location(Longitude): $_longitute',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Location(Latitude): $_latitute',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Socket Type: $_socketType',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        'Availability: $_available',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.pin_drop_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.electric_car_outlined),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
