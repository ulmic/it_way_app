import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_way_app/components/reusable_card.dart';
import 'package:it_way_app/components/login_button.dart';
import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/statics/colors.dart';
import 'package:it_way_app/statics/assets.dart';
import 'package:it_way_app/screen_navigation.dart';
import 'package:it_way_app/statics/navigation.dart';
import 'package:it_way_app/components/appBarBack.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarBack(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Авторизация',
                      style: LibraryStyle.logInHeading,
                    ),
                  ),
                  Text(
                    'Чтобы у вас появилась возможность комментрировать, необходимо авторизироваться',
                    style: LibraryStyle.settings,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoginButton(
                  iconOnCard: LibraryAssets.vk,
                  color: LibraryColors.kActiveColor,
                ),
                SizedBox(width: 20.0),
                LoginButton(
                  iconOnCard: LibraryAssets.google,
                  color: LibraryColors.redColor,
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Настройки'.toUpperCase(),
                  style: LibraryStyle.settings,
                ),
                SizedBox(height: 10.0),
                ReusableCadrInProfileScreen(
                  iconOnCard: LibraryAssets.contenticon,
                  nameOfCard: 'Лента',
                ),
                ReusableCadrInProfileScreen(
                  iconOnCard: LibraryAssets.notifications,
                  nameOfCard: 'Уведомления',
                ),
              ],
            ),
            SizedBox(height: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Сообщество'.toUpperCase(),
                  style: LibraryStyle.settings,
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
          ],
        ),
      ),
    );
  }
}
