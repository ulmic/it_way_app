import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_way_app/components/login_button.dart';
import 'package:it_way_app/components/reusable_card.dart';
import 'package:it_way_app/components/login_widget.dart';
import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/statics/colors.dart';
import 'package:it_way_app/statics/assets.dart';

import 'package:it_way_app/components/appBarBack.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email;
  String password;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    void loginUser() {
      email = emailController.text;
      password = passwordController.text;

      emailController.clear();
      passwordController.clear();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoginWidget(
                  icon: Icon(
                    Icons.email,
                  ),
                  nameOfCard: 'Email',
                  controller: emailController,
                  obscure: false,
                ),
                LoginWidget(
                  icon: Icon(
                    Icons.lock,
                  ),
                  nameOfCard: 'Password',
                  controller: passwordController,
                  obscure: true,
                ),
                (showLogin
                    ? Column(
                        children: [
                          LoginButton(
                            label: 'Зарегистрироваться',
                            func: loginUser,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: GestureDetector(
                              child: Column(
                                children: [
                                  Text('Уже зарегестрированы?'),
                                  Text(
                                    'Войдите.',
                                    style: TextStyle(
                                        color: LibraryColors.kActiveColor),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  showLogin = false;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          LoginButton(
                            label: 'Войти',
                            func: loginUser,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: GestureDetector(
                              child: Column(
                                children: [
                                  Text('Еще не зарегестрированы?'),
                                  Text(
                                    'Регистрируйтесь.',
                                    style: TextStyle(
                                        color: LibraryColors.kActiveColor),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  showLogin = true;
                                });
                              },
                            ),
                          ),
                        ],
                      )),
              ],
            ),
            SizedBox(height: 30.0),
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
