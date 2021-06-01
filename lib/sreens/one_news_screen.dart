import 'package:flutter/material.dart';
import 'package:it_way_app/components/appBarBack.dart';
import 'package:it_way_app/data/news_data.dart';
import 'package:it_way_app/statics/style.dart';

class OneNewsScreen extends StatefulWidget {
  const OneNewsScreen({
    @required this.data,
  });
  final NewsData data;
  @override
  _OneNewsScreenState createState() => _OneNewsScreenState();
}

class _OneNewsScreenState extends State<OneNewsScreen> {
  String get newsTitle => widget.data.newsTitle;
  String get newsBody => widget.data.newsBody;
  String get newsImage => widget.data.newsImageURL;
  String get publishedAt => widget.data.publishedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarBack(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Image.network(newsImage),
              SizedBox(
                height: 20.0,
              ),
              Text(
                newsTitle,
                style: LibraryStyle.oneNewsHeading,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(newsBody, style: LibraryStyle.newsBody)
            ],
          ),
        ),
      ),
    );
  }
}
