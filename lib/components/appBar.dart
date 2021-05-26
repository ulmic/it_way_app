import 'package:flutter/material.dart';
import 'package:it_way_app/statics/style.dart';

import '../components/avatar.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({
    Key key,
    this.typeOfContent,
  })  : preferredSize = Size.fromHeight(70.0),
        super(key: key);

  @override
  final Size preferredSize;
  final String typeOfContent;

  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  String get typeOfContent => widget.typeOfContent;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                typeOfContent,
                style: LibraryStyle.headingStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Avatar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
