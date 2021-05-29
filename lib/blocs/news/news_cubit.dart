import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

import 'package:it_way_app/data/news_data.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(null);

  Future<List<NewsData>> getNews() async {
    emit(NewsStates.dataLoading());

    final json = await getjson();
    final List<NewsData> newsList = [];

    for (final jsonPodcast in json) {
      final attributes = jsonPodcast['attributes'];
      final String newsTitle = attributes['title'];
      final String newsImageURL = attributes['photo'];
      final String newsBody = attributes['body'];
      final String publishedAt = attributes['publishedAt'];

      NewsData news = NewsData(
        newsTitle: newsTitle,
        newsBody: newsBody,
        newsImageURL: newsImageURL,
        publishedAt: publishedAt,
      );
      newsList.add(news);
    }

    emit(NewsStates.dataLoaded(newsList));
  }

  dynamic getjson() async {
    final response = await http.get(Uri.parse(
        'http://red-magic.ru/api/v1/records?model=Tramway::News::News'));
    final json = jsonDecode(response.body);
    return json['data'];
  }
}
