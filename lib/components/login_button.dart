import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final IconData iconOnCard;
  final Color color;
  final Function logIn;
  const LoginButton({
    this.iconOnCard,
    this.color,
    this.logIn,
  });
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.color,
        ),
        height: 50.0,
        width: 140.0,
        child: Icon(
          widget.iconOnCard,
          color: Colors.white,
        ),
      ),
      onTap: widget.logIn,
    );
  }
}
