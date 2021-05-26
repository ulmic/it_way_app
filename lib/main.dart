import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_way_app/sreens/news_screen.dart';
import 'package:it_way_app/sreens/podcast_screen.dart';
import 'package:it_way_app/sreens/video_screen.dart';
import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/sreens/content_screen.dart';

import 'statics/assets.dart';
import 'statics/colors.dart';

void main() => runApp(new ItWayApp());

class ItWayApp extends StatefulWidget {
  static List<Widget> _widgetOptions = <Widget>[
    PodcastScreen(),
    VideoScreen(),
    ContentScreen(),
    NewsScreen(),
    Text(
      'Вы пока не добавили еще ни одной закладки',
      style: LibraryStyle.optionStyle,
    )
  ];

  @override
  _ItWayAppState createState() => _ItWayAppState();
}

class _ItWayAppState extends State<ItWayApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: Center(
          child: ItWayApp._widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.0,
          selectedItemColor: LibraryColors.kActiveColor,
          unselectedItemColor: LibraryColors.kUnActiveColor,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mic,
              ),
              label: 'Подкасты',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LibraryAssets.videoicon,
              ),
              label: 'Видео',
            ),
            BottomNavigationBarItem(
              icon: Icon(LibraryAssets.contenticon),
              label: 'Лента',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LibraryAssets.newsicon,
              ),
              label: 'Статьи',
            ),
            BottomNavigationBarItem(
              icon: Icon(LibraryAssets.bookmarkicon),
              label: 'Закладки',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
