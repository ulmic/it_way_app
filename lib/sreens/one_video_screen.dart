import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:it_way_app/components/appBarBack.dart';
import 'package:it_way_app/data/video_data.dart';

class OneVideoScreen extends StatefulWidget {
  const OneVideoScreen({
    @required this.data,
  });
  final VideoData data;
  @override
  _OneVideoScreenState createState() => _OneVideoScreenState();
}

class _OneVideoScreenState extends State<OneVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarBack(),
      body: Column(),
    );
  }
}
