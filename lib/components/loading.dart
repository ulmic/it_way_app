import 'package:flutter/material.dart';
import 'package:it_way_app/statics/colors.dart';

class LoadingApp extends StatefulWidget {
  @override
  _LoadingAppState createState() => _LoadingAppState();
}

class _LoadingAppState extends State<LoadingApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'IT WAY',
            style: TextStyle(color: LibraryColors.kActiveColor, fontSize: 24.0),
          ),
          new CircularProgressIndicator(
            color: LibraryColors.kActiveColor,
          ),
        ],
      ),
    );
  }
}
