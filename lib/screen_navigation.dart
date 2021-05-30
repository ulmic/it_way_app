import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_way_app/sreens/one_video_screen.dart';
import 'package:it_way_app/sreens/user_screen.dart';
import 'package:it_way_app/statics/navigation.dart';
import 'package:it_way_app/sreens/profile_screen.dart';
import 'package:it_way_app/sreens/one_podcast_screen.dart';

class ScreenNavigation {
  static void routeTo({
    @required String route,
    @required BuildContext context,
    dynamic bundle,
  }) {
    switch (route) {
      case LibraryRoutes.profileScreen:
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) => ProfileScreen(),
          ),
        );
        break;
      case LibraryRoutes.userScreen:
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) => UserScreen(),
          ),
        );
        break;
      case LibraryRoutes.userScreenRemove:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<Widget>(builder: (context) => UserScreen()),
        );
        break;
      case LibraryRoutes.registerScreenRemove:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<Widget>(builder: (context) => ProfileScreen()),
        );
        break;
      case LibraryRoutes.onePodcastScreen:
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) => OnePodcastScreen(
              data: bundle['data'],
            ),
          ),
        );
        break;

      case LibraryRoutes.oneVideoScreen:
        Navigator.of(context).push(
          MaterialPageRoute<Widget>(
            builder: (BuildContext context) => OneVideoScreen(
              data: bundle['data'],
            ),
          ),
        );
        break;
      case LibraryRoutes.pop:
        Navigator.of(context).pop();
        break;
      default:
    }
  }
}
