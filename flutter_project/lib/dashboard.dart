import 'dart:convert';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/chargerList.dart';
import 'package:flutter_project/MyAccount.dart';
import 'package:flutter_project/RimoneChargeCard.dart';
import 'package:flutter_project/appBar.dart';
import 'package:flutter_project/bottomAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_project/VehicleInfo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'appBar.dart';

class DashboardScreen extends StatefulWidget {
  final userID;

  DashboardScreen({Key? key, required this.userID}) : super(key: key);

  //userID = userID;
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //Google Maps functionality
  static final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(26.4499, 74.6399), //Ajmer
    zoom: 15,
  );

  /*************************         All Controllers          ***************************/

  //Google Map controller
  late GoogleMapController _googleMapController;

  //Custom info window controller
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  Uint8List? markerImages;

// Multiple Images list for marker
  final List<String> images = [
    'assets/charger/car_charger_fill.png',
    'assets/charger/car_charger_fill.png',
    'assets/charger/car_charger_fill.png',
    'assets/charger/car_charger_fill.png',
  ];

// Multiple LatLng position for list of marker
  final List<LatLng> _latlng = <LatLng>[
    LatLng(26.4588, 74.6355),
    LatLng(26.4400, 74.6359),
    LatLng(26.4518, 74.6315),
    LatLng(26.4420, 74.6329),
    //_Falcon1ChargerCLatngConstructor
  ];

  final List<Marker> _markers = <Marker>[
    Marker(markerId: MarkerId('12'), position: LatLng(26.4419, 74.6299))
  ];

/*
 @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId(' charger1'),
        position: LatLng(26.4499, 74.6399),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        onTap: () {
          // handle marker tap event
          // to get UserID

        },
      ),
    );
  }
*/

  Future<Uint8List> getBytesfromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  var _username;
  var _name;
  var _email;
  var _phone;

  get userID => DashboardScreen(userID: userID);

  Future<void> _fetchUserData(userID) async {
    print("**MyUser ID is: ${userID}");
    // Headers to pass for API call
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };

    final response = await http.get(
        Uri.parse('http://dev.rimone.online:3000/api/users/${userID}'),
        headers: headers);

    // If-Else Condition for API Call
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        _username = data['id'];
        _name = data['name'];
        _email = data['email'];
        _phone = data['phone'];
      });
    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  //for Profile Drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    super.initState();
    _fetchUserData(widget.userID);
  }

  //Marker Deatils
  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markerIcon = await getBytesfromAssets(images[i], 100);
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: _latlng[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade300,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/charger/charging_station_roof.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              //width: MediaQuery.of(context).size.width * 0.28,
                              child: Text('Address Of \nCharger:'),
                            ),
                            Container(
                                alignment: Alignment.topCenter,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                //width: MediaQuery.of(context).size.width * 0.20,
                                constraints: BoxConstraints(maxHeight: 30.0),
                                child: SingleChildScrollView(
                                  child: Text(
                                      'Falcon XZ,\nMartindal Bridge,\nKesargunj,\nAjmer'
                                      //controller: _chargerAddressController,
                                      ),
                                )
                            ),
                          ],
                        ),
                      ),
/*                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.008),*/
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              //width: MediaQuery.of(context).size.width * 0.20,
                              child: Text('Connector Type:'),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              //width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                'A, B, & C',
                                //_chargerTypeController.text;
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              //width: MediaQuery.of(context).size.width * 0.20,
                              child: Text('Availabiiy:'),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              //width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                'Yes/No',
                                //_chargerTypeController.text;
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              //width: MediaQuery.of(context).size.width * 0.20,
                              child: Icon(
                                Icons.control_camera_sharp,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              //width: MediaQuery.of(context).size.width * 0.28,
                              child: Text(
                                'Yes/No',
                                //_chargerTypeController.text;
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _latlng[i],
            );
          },
/*          infoWindow: InfoWindow(
            title: 'Falcon 1',
          )*/
        ),
      );
      setState(() {});
    }
  }

  //To geut UserID
/*  @override
  void initState() {
    super.initState();
    _fetchUserData(widget.userID);
  }*/

  //Main page and contents
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/profile_icon.png'),
                            backgroundColor: Colors.transparent,

                          ),
                        ),
                          Text('$_name'),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
              ),
            ),
            ListTile(
              title: Text('My Account'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccount()));
                // Perform action
              },
            ),
            ListTile(
              title: Text('Charging History'),
              onTap: () {
                // Perform action
              },
            ),
            ListTile(
              title: Text('My Vehicles'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VehicleInfo()),
                );
              },
            ),
            ListTile(
              title: Text('Rimone Charge Card'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RimoneChargeCard()),
                );
                // Perform action
              },
            ),
            ListTile(
              title: Text('My Usage'),
              onTap: () {
                // Perform action
              },
            ),
            ListTile(
              title: Text('Preferred Locations'),
              onTap: () {
                // Perform action
              },
            ),
            ListTile(
              title: Text('Payment Methods'),
              onTap: () {
                // Perform action
              },
            ),
            ListTile(
              title: Text('My Bookings'),
              onTap: () {
                // Perform action
              },
            ),
            ListTile(
              title: Text('Help & Support'),
              onTap: () {
                // Perform action
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Perform action
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (GoogleMapController controller) =>
                _customInfoWindowController.googleMapController = controller,
            markers: Set<Marker>.of(_markers),
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.6,
            offset: 50,
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              heroTag: 'btn2',
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(_initialCameraPosition),
              ),
              child: const Icon(Icons.contact_support),
            ),
          ),
          Positioned(
            bottom: 86.0,
            right: 16.0,
            child: FloatingActionButton(
              heroTag: 'btn3',
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              onPressed: () {},
              child: const Icon(Icons.qr_code_scanner),
            ),
          ),
          Positioned(
            bottom: 156.0,
            right: 16.0,
            child: FloatingActionButton(
              heroTag: 'btn4',
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              onPressed: () {},
              child: const Icon(Icons.my_location),
            ),
          ),
          Positioned(
            bottom: 660.0,
            right: 350.0,
            child: FloatingActionButton(
              heroTag: 'btn5',
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              onPressed: () {},
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

//Search Bar function
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
