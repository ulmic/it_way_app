import 'package:flutter/material.dart';
import 'package:it_way_app/data/podcast_data.dart';

import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/screen_navigation.dart';
import 'package:it_way_app/statics/navigation.dart';

class PodcastCard extends StatefulWidget {
  const PodcastCard({
    @required this.data,
  });

  final PodcastData data;
  @override
  _PodcastCardStateState createState() => _PodcastCardStateState();
}

class _PodcastCardStateState extends State<PodcastCard> {
  String get podcastTitle => widget.data.podcastTitle;
  String get podcastNumber => widget.data.podcastNumber.toString();
  String get podcastImage => widget.data.podcastImageURL;
  String get playingTimeOfPodcast => widget.data.playingTimeOfPodcast;
  String get publishedAt => widget.data.publishedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
      height: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: InkWell(
          onTap: () {
            ScreenNavigation.routeTo(
              route: LibraryRoutes.onePodcastScreen,
              context: context,
              bundle: <String, dynamic>{
                'data': widget.data,
              },
            );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: podcastImage != null
                        ? NetworkImage(podcastImage)
                        : AssetImage('assets/images/podcast.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.white,
                                size: 12.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                playingTimeOfPodcast,
                                style: LibraryStyle.typeContentStyle,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                publishedAt,
                                style: LibraryStyle.typeContentStyle,
                              ),
                            ],
                          ),
                          Text(
                            podcastTitle,
                            style: LibraryStyle.headingPodcastAndNews,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Text("Эпизод " + podcastNumber,
                          style: LibraryStyle.subtitleStyle),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
