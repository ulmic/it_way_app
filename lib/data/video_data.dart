import 'package:flutter/material.dart';

class VideoData {
  const VideoData({
    @required this.videoURL,
    @required this.videoTitle,
    @required this.videoPreviewURL,
    @required this.videoDescription,
  });

  final String videoTitle;
  final String videoPreviewURL;
  final String videoDescription;
  final String videoURL;
}
