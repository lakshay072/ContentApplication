import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:news_app/first_screen.dart';
import 'package:news_app/second_blog.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: first_screen(),
      ),
    );
  }
}