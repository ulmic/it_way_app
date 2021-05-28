import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:it_way_app/screen_navigation.dart';
import 'package:it_way_app/statics/navigation.dart';
import 'package:it_way_app/statics/assets.dart';

class AppBarBack extends StatefulWidget implements PreferredSizeWidget {
  AppBarBack({
    Key key,
  })  : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;
  _AppBarBackState createState() => _AppBarBackState();
}

class _AppBarBackState extends State<AppBarBack> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: PreferredSize(
        preferredSize: Size.fromHeight(15.0),
        child: GestureDetector(
          onTap: () {
            ScreenNavigation.routeTo(
                route: LibraryRoutes.pop, context: context);
          },
          child: Icon(
            LibraryAssets.back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
