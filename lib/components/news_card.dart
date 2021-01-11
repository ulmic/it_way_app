import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    @required this.newsTitle,
    @required this.newsSubtitle,
    @required this.newsImage,
  });

  final String newsTitle;
  final String newsSubtitle;
  final String newsImage;

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  String get newsTitle => widget.newsTitle;
  String get newsSubtitle => widget.newsSubtitle;
  String get newsImage => widget.newsImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 370,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(newsImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ListTile(
                  title: Text(newsTitle,
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  subtitle: Text(
                    newsSubtitle,
                    style: TextStyle(color: Colors.white60.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
