import 'package:carousel_slider/carousel_slider.dart';
import 'package:content_application/screens/blog_page.dart';
import 'package:content_application/services/push_notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:content_application/components/app_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PushNotificationsService pushNotificationsService =
      PushNotificationsService();
/*
NotificationServices notificationServices = NotificationServices();
*/
  final CarouselController _carouselController = CarouselController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    pushNotificationsService.requestNotificationsPermission();
    pushNotificationsService.firebaseInit(context);
    pushNotificationsService.setupInteractMessage(context);
    pushNotificationsService.getDeviceToken().then((value) {
      print('Device token:$value ');
    });
      //pushNotificationsService.isTokenRefresh();
    //});

  }


  @override
  Widget build(BuildContext context) {
    setState(() {
      _isLoading = false;
    });
    return Scaffold(
      appBar: ContentAppBar(),
      body: Visibility(
        visible: _isLoading,
        replacement: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                //Search Bar
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff302360),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "eg : Dogecoin to the moon",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.purple.shade100,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                //Slider
                CarouselSlider(
                    carouselController: _carouselController,
                    items: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
/*                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => first_blog()),
                            );*/
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  opacity: 0,
                                  image: AssetImage('assets/icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 120,
                            left: 20,
                            right: 10,
                            child: Text(
                              'heading3',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'Newyork',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Positioned(
                            top: 190,
                            left: 20,
                            right: 10,
                            child: Text(
                              'quote',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
/*                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => second_blog()),
                          );*/
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  opacity: 0,
                                  image: AssetImage('assets/icon.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 120,
                            left: 20,
                            right: 10,
                            child: Text(
                              '_heading3',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'Newyork',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Positioned(
                            top: 200,
                            left: 20,
                            right: 10,
                            child: Text(
                              '_quote',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                        ],
                      ),
                    ],
                    options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 100),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {});
                        })),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text('Top Stories',                         style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontFamily: 'Newyork',
                    fontWeight: FontWeight.bold),),
                //Tiles Views of blogs
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
/*                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => first_blog()),
                    );*/
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            opacity: 0,
                            image: AssetImage('assets/icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      left: 20,
                      right: 10,
                      child: Text(
                        'heading3',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Newyork',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Positioned(
                      top: 140,
                      left: 20,
                      right: 10,
                      child: Text(
                        'quote',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BlogPage()),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            opacity: 0,
                            image: AssetImage('assets/icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      left: 20,
                      right: 10,
                      child: Text(
                        'heading3',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Newyork',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Positioned(
                      top: 140,
                      left: 20,
                      right: 10,
                      child: Text(
                        'quote',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                //For loading icon
                if (_isLoading)
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20),
                    child: const CircularProgressIndicator(
                      color: Color(0xFFFF3A44),
                    ),
                  ),
              ],
            ),
          ),
        ), // Show only when loading is true
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
