import 'package:flutter/material.dart';
import 'package:it_way_app/components/video_card.dart';
import 'package:it_way_app/components/appBar.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<VideoCard> videoData = [
    VideoCard(
      videoTitle: 'Название',
      videoImage: 'assets/images/video.jpg',
      typeOfContent: 'Новое видео',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(typeOfContent: 'Видео'),
      body: SafeArea(
        child: ListView.builder(
            itemCount: videoData.length,
            itemBuilder: (context, index) {
              return videoData[index];
            }),
      ),
    );
  }
}
