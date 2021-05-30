import 'package:firebase_auth/firebase_auth.dart';
import 'package:it_way_app/user.dart';

class AuthSrevice {
  final FirebaseAuth fAuth = FirebaseAuth.instance;

  Future<UserProfile> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return UserProfile.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserProfile> registrWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return UserProfile.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await fAuth.signOut();
  }

  Stream<UserProfile> get currentUser {
    return fAuth.authStateChanges().map(
        (User user) => user != null ? UserProfile.fromFirebase(user) : null);
  }
}
