import 'package:flutter/material.dart';

import '../components/news_card.dart';

import 'package:it_way_app/components/appBar.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsCard> newsData = [
    NewsCard(
        newsTitle: 'Новость 1',
        newsSubtitle: 'Второй текст',
        newsImage: 'assets/images/news1.jpg',
        typeOfContent: 'Новости'),
    NewsCard(
        newsTitle: 'Статья 1',
        newsSubtitle: 'Второй текст',
        newsImage: 'assets/images/news2.jpg',
        typeOfContent: 'Статья'),
    NewsCard(
        newsTitle: 'Новость 3',
        newsSubtitle:
            'текс текст текст текст текст текст текст текст текст текст текст текст текст текст текст',
        newsImage: 'assets/images/news3.jpg',
        typeOfContent: 'Новости'),
    NewsCard(
        newsTitle: 'Статья 2',
        newsSubtitle: 'Второй текст',
        newsImage: 'assets/images/news1.jpg',
        typeOfContent: 'Cтатья'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(typeOfContent: 'Статьи/новости'),
      body: SafeArea(
        child: ListView.builder(
            itemCount: newsData.length,
            itemBuilder: (context, index) {
              return newsData[index];
            }),
      ),
    );
  }
}
