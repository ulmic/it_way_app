import 'package:flutter/material.dart';

import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/statics/colors.dart';

class ReusableCadrInProfileScreen extends StatefulWidget {
  @override
  final IconData iconOnCard;
  final String nameOfCard;

  const ReusableCadrInProfileScreen({this.iconOnCard, this.nameOfCard});
  _ReusableCadrInProfileScreenState createState() =>
      _ReusableCadrInProfileScreenState();
}

class _ReusableCadrInProfileScreenState
    extends State<ReusableCadrInProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: LibraryColors.kUnActiveColor),
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    widget.iconOnCard,
                    size: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    widget.nameOfCard,
                    style: LibraryStyle.reusableCardStyle,
                  ),
                ],
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
