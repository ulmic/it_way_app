import 'package:bloc/bloc.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:it_way_app/blocs/video/video_state.dart';
import 'package:it_way_app/data/video_data.dart';

class VideoCubit extends Cubit<VideoStates> {
  VideoCubit() : super(null);

  Future<List<VideoData>> getVideoList() async {
    emit(VideoStates.dataLoading());

    final json = await getjson();
    final List<VideoData> videoList = [];

    for (final jsonVideo in json) {
      final attributes = jsonVideo['attributes'];
      final String videoTitle = attributes['title'];
      final String videoPreviewURL = attributes['preview'];
      final String videoDescription = attributes['description'];

      VideoData video = VideoData(
        videoTitle: videoTitle,
        videoDescription: videoDescription,
        videoPreviewURL: videoPreviewURL,
      );

      videoList.add(video);
    }
    emit(VideoStates.dataLoaded(videoList));
  }

  dynamic getjson() async {
    final response =
        await http.get('http://red-magic.ru/api/v1/records?model=Video');
    final json = jsonDecode(response.body);
    return json['data'];
  }
}
