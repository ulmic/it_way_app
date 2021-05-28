import 'package:flutter/material.dart';
import 'package:it_way_app/data/video_data.dart';

import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/screen_navigation.dart';
import 'package:it_way_app/statics/navigation.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({
    @required this.data,
  });

  final VideoData data;

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  String get videoTitle => widget.data.videoTitle;
  String get videoImage => widget.data.videoPreviewURL;
  String get videoURl => widget.data.videoURL;
  String get description => widget.data.videoDescription;

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
            ScreenNavigation.routeTo(
              route: LibraryRoutes.oneVideoScreen,
              context: context,
              bundle: <String, dynamic>{
                'data': widget.data,
              },
            );
          },
          child: Column(
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
                    image: NetworkImage(videoImage),
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
                      'ВИДЕО',
                      style: LibraryStyle.subtitleStyle,
                    ),
                    Text(
                      videoTitle,
                      style: LibraryStyle.headingVideo,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
