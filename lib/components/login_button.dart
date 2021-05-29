import 'package:flutter/material.dart';
import 'package:it_way_app/statics/style.dart';

class LoginButton extends StatefulWidget {
  final String nameOfCard;
  final Color color;
  final Function logIn;
  const LoginButton({
    this.nameOfCard,
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
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            widget.nameOfCard,
            style: LibraryStyle.loginButtonText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTap: widget.logIn,
    );
  }
}
