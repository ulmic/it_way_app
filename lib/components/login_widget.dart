import 'package:flutter/material.dart';
import 'package:it_way_app/statics/colors.dart';
import 'package:it_way_app/statics/style.dart';

class LoginWidget extends StatefulWidget {
  final String nameOfCard;
  final Icon icon;

  final TextEditingController controller;
  final bool obscure;

  const LoginWidget({
    this.nameOfCard,
    this.icon,
    this.controller,
    this.obscure,
  });
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: widget.controller,
          obscureText: widget.obscure,
          decoration: InputDecoration(
              hintText: widget.nameOfCard,
              hintStyle: LibraryStyle.loginText,
              prefixIcon: Padding(
                padding: EdgeInsets.all(8.0),
                child: IconTheme(
                    data: IconThemeData(color: LibraryColors.kActiveColor),
                    child: widget.icon),
              )),
        ),
      ),
    );
  }
}
