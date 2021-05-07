import 'package:flutter/material.dart';

import 'package:it_way_app/statics/style.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    @required this.newsTitle,
    @required this.newsSubtitle,
    @required this.newsImage,
    @required this.typeOfContent,
  });

  final String newsTitle;
  final String newsSubtitle;
  final String newsImage;
  final String typeOfContent;

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  String get newsTitle => widget.newsTitle;
  String get newsSubtitle => widget.newsSubtitle;
  String get newsImage => widget.newsImage;
  String get typeOfContent => widget.typeOfContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
      height: MediaQuery.of(context).size.width * 1.05,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: InkWell(
          onTap: () {
            print('Card tapped');
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: AssetImage(newsImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text(
                          typeOfContent,
                          style: LibraryStyle.typeContentStyle,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Дата',
                          style: LibraryStyle.typeContentStyle,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 15.0),
                    title: Text(newsTitle,
                        style: LibraryStyle.headingPodcastAndNews),
                    subtitle:
                        Text(newsSubtitle, style: LibraryStyle.subtitleStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
