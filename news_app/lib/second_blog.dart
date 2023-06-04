import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chewie/chewie.dart';
import 'package:news_app/main.dart';
import 'package:video_player/video_player.dart';


class ChewiePlayerWidget extends StatefulWidget {
  final String videoUrl;

  const ChewiePlayerWidget({required this.videoUrl});

  @override
  _ChewiePlayerWidgetState createState() => _ChewiePlayerWidgetState();
}

class _ChewiePlayerWidgetState extends State<ChewiePlayerWidget> {
  late ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    super.dispose();
  }

  void _initializePlayer() {
    final videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    videoPlayerController.initialize().then((_) {
      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: true,
          looping: true,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController! != null && _chewieController!.videoPlayerController.value.isInitialized) {
      return Chewie(
        controller: _chewieController!,
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
class second_blog extends StatefulWidget {
  const second_blog({Key? key}) : super(key: key);

  @override
  State<second_blog> createState() => _second_blogState();
}

class _second_blogState extends State<second_blog> {
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

  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    fetchData2();
  }



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
          _quote = _jsonResponse['results'][11]['quote']['rich_text'][0]
          ['text']['content'];
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
      // Set isLoading to false after data is fetched
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoading, // Show only when loading is true
        child: Center(
        child: CircularProgressIndicator(),
    ),
    replacement:Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 1.7,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: _imageUrl != null
                          ? DecorationImage(
                        image: NetworkImage(_imageUrl!),
                        fit: BoxFit.fill,
                      )
                          : null,
                    ),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                  Positioned(
                    top: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              child: Text(
                                '$_firstContent',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                            Container(
                              child: Text(
                                '$_secondContent',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                            Container(
                              child: Text(
                                '$_thirdContent',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.black,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '$_quote',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  '$_hereIsAVideo',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nunito-Black'),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                            ChewiePlayerWidget(videoUrl: _videoUrl),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 275,
                    right: 30,
                    left: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueGrey.shade300.withOpacity(0.9),
                            Colors.grey.shade600.withOpacity(0.9)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          '$_heading3',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: 'Newyork',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    isLoading
    ? Positioned(
    top: MediaQuery.of(context).size.height * 0.5,
    left: MediaQuery.of(context).size.width * 0.5,
      child: const CircularProgressIndicator(color: Color(0xFFFF3A44),),
    )
        : SizedBox(),
          Positioned(
            bottom: 46.0,
            right: 26.0,
            child: FloatingActionButton(
              backgroundColor: Color(0xFFFF3A44),
              foregroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(Icons.favorite_border_outlined),
            ),
          ),
        ],
      ),
      ),

    );
  }
}
