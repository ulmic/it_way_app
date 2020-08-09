import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'news_card.dart';
import 'news_screen.dart';

void main() => runApp(new ItWayApp());

class ItWayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('News IT Way'),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            NewsCard(
              newsTitle: 'News 1',
              newsSubtitle: 'Secondary text',
              newsImage: 'images/news1.jpg',
            ),
          ],
        )),
      ),
    );
  }
}
