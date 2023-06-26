import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
    if (_chewieController != null &&
        _chewieController!.videoPlayerController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _chewieController!.videoPlayerController.value.aspectRatio,
        child: Chewie(
          controller: _chewieController!,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}


class first_blog extends StatefulWidget {
  const first_blog({Key? key}) : super(key: key);



  @override
  State<first_blog> createState() => _first_blogState();

}

class _first_blogState extends State<first_blog> {


  bool isLoading = true; // Track the loading state

  @override
  void initState() {
    super.initState();
    fetchData();
  }



  // For First Blog Post
  var quote = '';
  var colorValue = '';
  var imageUrl = '';
  var heading = '';
  var content = '';
  var id = '';
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
      'Authorization': 'Bearer secret_6FUwEepND9KKRbw6SUxYailRLqVEMbsnhs5DgQxzIQ3',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          //content  = jsonResponse['results'][1]['heading_3']['rich_text']['text']['content'];
          heading3 =
          jsonResponse['results'][1]['heading_3']['rich_text'][0]['text']['content'];
          quote =
          jsonResponse['results'][7]['quote']['rich_text'][0]['text']['content'];
          imageUrl = jsonResponse['results'][3]['image']['external']['url'];
          content =
          jsonResponse['results'][5]['paragraph']['rich_text'][0]['text']['content'];
          prob_heading2 =
          jsonResponse['results'][9]['heading_2']['rich_text'][0]['text']['content'];
          prob_heading2_description = jsonResponse['results'][11]['paragraph']
          ['rich_text'][0]['text']['content'];
          sol_heading2 =
          jsonResponse['results'][13]['heading_2']['rich_text'][0]['text']['content'];
          sol_heading2_description = jsonResponse['results'][15]['paragraph']
          ['rich_text'][0]['text']['content'];
          heading1 =
          jsonResponse['results'][17]['heading_1']['rich_text'][0]['text']['content'];
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
            replacement: Stack(
              children: [

                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: imageUrl != null
                                ? DecorationImage(
                              image: NetworkImage(imageUrl!),
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
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
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
                                      '$content',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Nunito'),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                                        '$quote',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Nunito'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: Text(
                                        '$prob_heading2',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nunito-Black'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                  Container(
                                    child: Text(
                                      '$prob_heading2_description',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Nunito'),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: Text(
                                        '$sol_heading2',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nunito-Black'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                  Container(
                                    child: Text(
                                      '$sol_heading2_description',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: 'Nunito', decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: Text(
                                        '$heading1',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Nunito-Black'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                  ChewiePlayerWidget(videoUrl: heading1_video),
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
                                  Colors.blueGrey.shade300.withOpacity(1),
                                  Colors.grey.shade600.withOpacity(1),
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
                                '$heading3',
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
                  // Show circular progress indicator in the center of the screen while loading
                  top: MediaQuery.of(context).size.height * 0.5,
                  left: MediaQuery.of(context).size.width * 0.5,
                  child: CircularProgressIndicator(color: Color(0xFFFF3A44),),
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
