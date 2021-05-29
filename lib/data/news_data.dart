import 'package:flutter/material.dart';

class NewsData {
  const NewsData({
    @required this.newsTitle,
    @required this.newsImageURL,
    @required this.publishedAt,
    @required this.newsBody,
  });

  final String newsTitle;
  final String newsImageURL;
  final String publishedAt;
  final String newsBody;
}
