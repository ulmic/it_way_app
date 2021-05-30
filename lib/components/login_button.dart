import 'package:flutter/material.dart';
import 'package:it_way_app/statics/colors.dart';
import 'package:it_way_app/statics/style.dart';

class LoginButton extends StatefulWidget {
  final String label;
  final Function func;
  const LoginButton({
    this.label,
    this.func,
  });
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.func();
      },
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: LibraryColors.kActiveColor),
        child: Center(
          child: Text(
            widget.label,
            style: LibraryStyle.loginButtonText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
