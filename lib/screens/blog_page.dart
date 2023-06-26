import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
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
    final videoPlayerController =
        VideoPlayerController.network(widget.videoUrl);
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
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //_fetchData();
  }

/*  void _fetchData() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoading,
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
                        color: Colors.purple.shade500,
/*                        image: imageUrl != null
                            ? DecorationImage(
                          image: NetworkImage(imageUrl!),
                          fit: BoxFit.fill,
                        )
                            : null,*/
                      ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width * 1,
                    ),
                    Positioned(
                      top: 350,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 120, left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                child: const Text(
                                  'content',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: 'Nunito'),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 4.0,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: const Text(
                                    'quote',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'Nunito'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'prob_heading2',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito-Black'),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              const Text(
                                'prob_heading2_description',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: 'Nunito'),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'sol_heading2',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito-Black'),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              const Text(
                                'sol_heading2_description',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: 'Nunito',
                                    decoration: TextDecoration.underline),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'heading1',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito-Black'),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              //ChewiePlayerWidget(videoUrl: heading1_video),
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
                              Colors.blue.shade100.withOpacity(1),
                              Colors.grey.shade800.withOpacity(1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            'heading3',
                            textAlign: TextAlign.justify,
                            style:  TextStyle(
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
                    child: const CircularProgressIndicator(
                      color: Color(0xFFFF3A44),
                    ),
                  )
                : const SizedBox(),
            Positioned(
              bottom: 46.0,
              right: 26.0,
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFFF3A44),
                foregroundColor: Colors.white,
                onPressed: () {},
                child: const Icon(Icons.favorite_border_outlined),
              ),
            ),
          ],
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
