import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:it_way_app/components/login_button.dart';
import 'package:it_way_app/components/reusable_card.dart';
import 'package:it_way_app/components/login_widget.dart';
import 'package:it_way_app/services/auth.dart';
import 'package:it_way_app/statics/navigation.dart';
import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/statics/colors.dart';
import 'package:it_way_app/statics/assets.dart';

import 'package:it_way_app/components/appBarBack.dart';
import 'package:it_way_app/user.dart';

import '../screen_navigation.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  String email;
  String password;
  String userName;
  bool showLogin = true;

  AuthSrevice authService = AuthSrevice();

  @override
  Widget build(BuildContext context) {
    void loginUser() async {
      email = emailController.text;
      password = passwordController.text;

      if (email.isEmpty || password.isEmpty) return;

      UserProfile user = await authService.signinWithEmailAndPassword(
          email.trim(), password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: 'Не удалось войти!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 16.0);
      } else {
        ScreenNavigation.routeTo(
            route: LibraryRoutes.userScreenRemove, context: context);
        emailController.clear();
        passwordController.clear();
      }
    }

    void registerUser() async {
      email = emailController.text;
      password = passwordController.text;
      userName = userNameController.text;

      if (email.isEmpty || password.isEmpty || userName.isEmpty) return;

      UserProfile user = await authService.registrWithEmailAndPassword(
          email.trim(), password.trim());
      if (user == null) {
        Fluttertoast.showToast(
            msg: 'Не удалось зарегистрироваться!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.black,
            fontSize: 16.0);
      } else {
        var ref = FirebaseFirestore.instance.doc('user/${user.id}');
        ref.set({
          'name': userName,
        });
        ScreenNavigation.routeTo(
          route: LibraryRoutes.userScreenRemove,
          context: context,
        );
        emailController.clear();
        passwordController.clear();
      }
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
                SizedBox(
                  height: 20,
                ),
                (showLogin
                    ? Column(
                        children: [
                          LoginWidget(
                            icon: Icon(
                              Icons.account_circle,
                            ),
                            nameOfCard: 'Введите никнейм',
                            controller: userNameController,
                            obscure: false,
                          ),
                          LoginButton(
                            label: 'Зарегистрироваться',
                            func: registerUser,
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
