import 'package:flutter/material.dart';

class PodcastData {
  const PodcastData({
    @required this.podcastNumber,
    @required this.podcastTitle,
    @required this.podcastImageURL,
    @required this.publishedAt,
    @required this.playingTimeOfPodcast,
  });
  final int podcastNumber;
  final String podcastTitle;
  final String podcastImageURL;
  final String publishedAt;
  final String playingTimeOfPodcast;
}
