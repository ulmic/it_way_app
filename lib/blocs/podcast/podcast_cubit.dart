import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:it_way_app/blocs/podcast/podcast_state.dart';
import 'package:it_way_app/data/podcast_data.dart';

class PodcastCubit extends Cubit<PodcastStates> {
  PodcastCubit() : super(null);

  Future<List<PodcastData>> getPodcasts() async {
    emit(PodcastStates.dataLoading());

    final json = await getjson();
    final List<PodcastData> podcasts = [];

    for (final jsonPodcast in json) {
      final attributes = jsonPodcast['attributes'];
      final int podcastNumber = attributes['number'];
      final String podcastTitle = attributes['title'];
      final String podcastImageURL = attributes['image'];
      final String publishedAt = attributes['published-at'];
      final String playingTimeOfPodcast = attributes['duration'];

      PodcastData podcast = PodcastData(
        playingTimeOfPodcast: playingTimeOfPodcast,
        podcastImageURL: podcastImageURL,
        podcastNumber: podcastNumber,
        podcastTitle: podcastTitle,
        publishedAt: publishedAt,
        audioFile: 'сделать',
      );
      podcasts.add(podcast);
    }

    emit(PodcastStates.dataLoaded(podcasts));
  }

  dynamic getjson() async {
    final response = await http
        .get('http://red-magic.ru/api/v1/records?model=Podcast::Episode');
    final json = jsonDecode(response.body);
    return json['data'];
  }
}
