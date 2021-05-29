import 'package:it_way_app/data/news_data.dart';

class NewsStates {
  const NewsStates._({this.status = NewsStatus.dataLoading, this.news});

  const NewsStates.dataLoaded(List<NewsData> news)
      : this._(
          status: NewsStatus.dataLoaded,
          news: news,
        );

  const NewsStates.failure() : this._(status: NewsStatus.failure);

  const NewsStates.dataLoading() : this._(status: NewsStatus.dataLoading);

  final NewsStatus status;
  final List<NewsData> news;
}

enum NewsStatus { dataLoaded, failure, dataLoading }
