import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_way_app/components/login_button.dart';
import 'package:it_way_app/components/reusable_card.dart';
import 'package:it_way_app/components/login_widget.dart';
import 'package:it_way_app/screen_navigation.dart';
import 'package:it_way_app/services/auth.dart';
import 'package:it_way_app/statics/navigation.dart';
import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/statics/colors.dart';
import 'package:it_way_app/statics/assets.dart';

import 'package:it_way_app/components/appBarBack.dart';
import 'package:it_way_app/user.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBarBack(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Настройка профиля',
                    style: LibraryStyle.logInHeading,
                  ),
                ),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: 'Введите никнейм',
                    hintStyle: LibraryStyle.loginText,
                  ),
                ),
                SizedBox(height: 30.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Сообщество'.toUpperCase(),
                    style: LibraryStyle.settings,
                  ),
                ),
                SizedBox(height: 10.0),
                ReusableCadrInProfileScreen(
                  iconOnCard: LibraryAssets.syte,
                  nameOfCard: 'Сайт',
                ),
                ReusableCadrInProfileScreen(
                  iconOnCard: LibraryAssets.telegram,
                  nameOfCard: 'Чат в телеграмме',
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                AuthSrevice().logOut();
                ScreenNavigation.routeTo(
                    route: LibraryRoutes.registerScreenRemove,
                    context: context);
              },
              child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: LibraryColors.kActiveColor),
                child: Center(
                  child: Text(
                    'Выйти',
                    style: LibraryStyle.loginButtonText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
