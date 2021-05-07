import 'package:flutter/material.dart';
import 'package:it_way_app/components/appBar.dart';

class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(typeOfContent: 'Лента'),
      body: SafeArea(
        child: Text('djf'),
      ),
    );
  }
}
