import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:it_way_app/data/podcast_data.dart';
import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/components/appBarBack.dart';

class OnePodcastScreen extends StatefulWidget {
  const OnePodcastScreen({
    @required this.data,
  });
  final PodcastData data;
  @override
  _OnePodcastScreenState createState() => _OnePodcastScreenState();
}

class _OnePodcastScreenState extends State<OnePodcastScreen> {
  String get podcastImage => widget.data.podcastImageURL;
  String get podcastTitle => widget.data.podcastTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: Colors.white,
      body: AudioServiceWidget(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 300.0,
                  child: Image.network(podcastImage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  podcastTitle,
                  style: LibraryStyle.headingVideo,
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('asd'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
