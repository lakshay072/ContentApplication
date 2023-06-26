import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/second_blog.dart';

import 'first_blog.dart';

class first_screen extends StatefulWidget {
  const first_screen({Key? key}) : super(key: key);

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  final TextEditingController _searchController = TextEditingController();
  final CarouselController _carouselController = CarouselController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchData2(); // Call your function here
  }

// For First Blog Post
  var quote = '';
  var colorValue = '';
  var imageUrl = '';
  var heading = '';
  var content = '';
  var id = 'id';
  var heading3 = '';
  var prob_heading2 = '';
  var prob_heading2_description = '';
  var sol_heading2 = '';
  var sol_heading2_description = '';
  var heading1 = '';
  var heading1_video = '';

  Future<void> fetchData() async {
    final url =
        'https://api.notion.com/v1/blocks/cc9914a294b24306a46d0311baf552e6/children?page_size=200';
    final headers = {
      'Notion-Version': '2022-02-22',
      'Authorization':
          'Bearer secret_6FUwEepND9KKRbw6SUxYailRLqVEMbsnhs5DgQxzIQ3',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          //content  = jsonResponse['results'][1]['heading_3']['rich_text']['text']['content'];
          heading3 = jsonResponse['results'][1]['heading_3']['rich_text'][0]
              ['text']['content'];
          quote = jsonResponse['results'][7]['quote']['rich_text'][0]['text']
              ['content'];
          imageUrl = jsonResponse['results'][3]['image']['external']['url'];
          content = jsonResponse['results'][5]['paragraph']['rich_text'][0]
              ['text']['content'];
          prob_heading2 = jsonResponse['results'][9]['heading_2']['rich_text']
              [0]['text']['content'];
          prob_heading2_description = jsonResponse['results'][11]['paragraph']
              ['rich_text'][0]['text']['content'];
          sol_heading2 = jsonResponse['results'][13]['heading_2']['rich_text']
              [0]['text']['content'];
          sol_heading2_description = jsonResponse['results'][15]['paragraph']
              ['rich_text'][0]['text']['content'];
          heading1 = jsonResponse['results'][17]['heading_1']['rich_text'][0]
              ['text']['content'];
          heading1_video =
              jsonResponse['results'][19]['video']['external']['url'];
          colorValue = jsonResponse['results'][6]['paragraph']['color'];
        });
        print(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        // Handle error here
      }
    } catch (e) {
      print('Error occurred: $e');
      // Handle error here
    }
  }

  //For Second Blog
  var _quote = '';
  String? _imageUrl = '';
  var _heading = '';
  var _firstContent = '';
  var _thirdContent = '';
  var _heading3 = '';
  var _secondContent = '';
  var _caption = '';
  var _hereIsAVideo = '';
  var _videoUrl = '';

  Future<void> fetchData2() async {
    final url =
        'https://api.notion.com/v1/blocks/1d00ea9592304d46bd95629c4eed38c3/children?page_size=200';
    final headers = {
      'Notion-Version': '2022-02-22',
      'Authorization':
          'Bearer secret_6FUwEepND9KKRbw6SUxYailRLqVEMbsnhs5DgQxzIQ3',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final _jsonResponse = jsonDecode(response.body);
        setState(() {
          _heading3 = _jsonResponse['results'][1]['heading_3']['rich_text'][0]
              ['text']['content'];
          _firstContent = _jsonResponse['results'][2]['paragraph']['rich_text']
              [0]['text']['content'];
          _imageUrl = _jsonResponse['results'][4]['image']['external']['url'];
          _secondContent = _jsonResponse['results'][5]['paragraph']['rich_text']
              [0]['text']['content'];
          _caption = _jsonResponse['results'][8]['embed']['url'];
          _thirdContent = _jsonResponse['results'][9]['paragraph']['rich_text']
              [0]['text']['content'];
          _quote = _jsonResponse['results'][11]['quote']['rich_text'][0]['text']
              ['content'];
          _hereIsAVideo = _jsonResponse['results'][13]['heading_3']['rich_text']
              [0]['text']['content'];
          _videoUrl = _jsonResponse['results'][15]['video']['external']['url'];
        });
        print(_jsonResponse);
        print('############################################## $_heading3');
      } else {
        print('Request failed with status: ${response.statusCode}.');
        // Handle error here
      }
    } catch (e) {
      print('Error occurred: $e');
      // Handle error here
    } finally {
      setState(() {
        _isLoading = false; // Set isLoading to false when done loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Visibility(
        visible: _isLoading, // Show only when loading is true
        child: Center(
        child: CircularProgressIndicator(),
    ),
    replacement:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.045,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    focusColor: Colors.green,
                    fillColor: Colors.green,
                    hoverColor: Colors.yellow,
                    hintText: 'Dogecoin to the moon',
                    hintStyle: TextStyle(fontSize: 14, height: 3),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Color(0xFFFF3A44),),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Color(0xFFFF3A44)), // Set the default border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.blueGrey), // Set the border color when focused
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Latest News',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Newyork',
                      ),
                    ),
                  ),
                  Container(
                      child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 12,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            CarouselSlider(
                carouselController: _carouselController,
                items: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => first_blog()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                opacity: 0.9,
                                image: NetworkImage('$imageUrl'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 120,
                          left: 20,
                          right: 10,
                          child: Text(
                            '$heading3',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: 'Newyork',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 190,
                          left: 20,
                          right: 10,
                          child: Text(
                            '$quote',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'Nunito'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => second_blog()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              opacity: 0.9,
                              image: NetworkImage('$_imageUrl'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        left: 20,
                        right: 10,
                        child: Text(
                          '$_heading3',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Newyork',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 20,
                        right: 10,
                        child: Text(
                          '$_quote',
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
                    height: 250,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    aspectRatio: 0.5 / 0.5,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 100),
                    viewportFraction: 0.85,
                    onPageChanged: (index, reason) {
                      setState(() {});
                    })),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => first_blog()),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              opacity: 0.9,
                              image: NetworkImage('$imageUrl'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        right: 10,
                        child: Text(
                          '$heading3',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Newyork',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        left: 20,
                        right: 10,
                        child: Text(
                          '$_quote',
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
                                builder: (context) => second_blog()),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              opacity: 0.9,
                              image: NetworkImage('$_imageUrl'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        right: 10,
                        child: Text(
                          '$_heading3',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Newyork',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        left: 20,
                        right: 10,
                        child: Text(
                          '$_quote',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
/*                  ElevatedButton(
                      onPressed: () {
                        fetchData();
                      },
                      child: Text("Press"))*/
                ],
              ),
            ),
            if (_isLoading)
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(color: Color(0xFFFF3A44),),
              ),
          ],
        ),
      ),
    ),);
  }
}
