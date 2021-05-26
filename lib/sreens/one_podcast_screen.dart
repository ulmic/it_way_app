import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:it_way_app/data/podcast_data.dart';

class OnePodcastScreen extends StatefulWidget {
  const OnePodcastScreen({
    @required this.data,
  });
  final PodcastData data;
  @override
  _OnePodcastScreenState createState() => _OnePodcastScreenState();
}

class _OnePodcastScreenState extends State<OnePodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
