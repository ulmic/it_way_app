import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('avatar tapped');
      },
      child: CircleAvatar(
        radius: 24.0,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/images/account_circle.png'),
      ),
    );
  }
}
