import 'package:flutter/material.dart';

import 'package:it_way_app/statics/style.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({
    @required this.videoTitle,
    @required this.videoImage,
    @required this.typeOfContent,
  });

  final String videoTitle;
  final String videoImage;
  final String typeOfContent;
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  String get videoTitle => widget.videoTitle;
  String get videoImage => widget.videoImage;
  String get typeOfContent => widget.typeOfContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
      height: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: InkWell(
          onTap: () {
            print('Card tapped');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(videoImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      typeOfContent,
                      style: LibraryStyle.subtitleStyle,
                    ),
                    Text(
                      videoTitle,
                      style: LibraryStyle.headingVideo,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
