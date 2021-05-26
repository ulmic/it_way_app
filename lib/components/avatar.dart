import 'package:flutter/material.dart';
import 'package:it_way_app/sreens/profile_screen.dart';

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      },
      child: CircleAvatar(
        radius: 24.0,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/images/account_circle.png'),
      ),
    );
  }
}
