import 'package:flutter/material.dart';

import 'package:it_way_app/screen_navigation.dart';
import 'package:it_way_app/statics/navigation.dart';
import 'package:it_way_app/user.dart';
import 'package:provider/provider.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    final UserProfile user = Provider.of<UserProfile>(context);
    final bool isloggedIn = user != null;

    return GestureDetector(
      onTap: () {
        isloggedIn
            ? ScreenNavigation.routeTo(
                route: LibraryRoutes.userScreen, context: context)
            : ScreenNavigation.routeTo(
                route: LibraryRoutes.profileScreen, context: context);
      },
      child: CircleAvatar(
        radius: 24.0,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/images/account_circle.png'),
      ),
    );
  }
}
