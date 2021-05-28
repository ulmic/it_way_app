import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:it_way_app/components/appBarBack.dart';
import 'package:it_way_app/data/video_data.dart';
import 'package:it_way_app/statics/style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class OneVideoScreen extends StatefulWidget {
  const OneVideoScreen({
    @required this.data,
  });
  final VideoData data;
  @override
  _OneVideoScreenState createState() => _OneVideoScreenState();
}

class _OneVideoScreenState extends State<OneVideoScreen> {
  String get videoPreview => widget.data.videoPreviewURL;
  String get videoDescription => widget.data.videoDescription;
  String get videoURL => widget.data.videoURL;
  String get videoTitle => widget.data.videoTitle;
  String videoId;
  YoutubePlayerController _controller;

  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.red.shade400,
          backgroundColor: Colors.grey,
        ),
        onReady: () {},
      ),
      builder: (_, player) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarBack(),
          body: Column(children: [
            player,
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Text(
                        videoTitle,
                        style: LibraryStyle.headingVideo,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(videoDescription,
                          style: LibraryStyle.videoDescription)
                    ],
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
