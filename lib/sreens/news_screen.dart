import 'package:flutter/material.dart';
import '../components/news_card.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<NewsCard> newsData = [
    NewsCard(
        newsTitle: 'News 1',
        newsSubtitle: 'Secondary text',
        newsImage: 'images/news1.jpg'),
    NewsCard(
        newsTitle: 'News 2',
        newsSubtitle: 'Secondary text',
        newsImage: 'images/news1.jpg'),
    NewsCard(
        newsTitle: 'News 2',
        newsSubtitle: 'Secondary text',
        newsImage: 'images/news1.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('News IT Way'),
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: newsData.length,
              itemBuilder: (context, index) {
                return newsData[index];
              }),
        ),
      ),
    );
  }
}
