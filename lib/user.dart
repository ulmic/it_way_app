import 'package:firebase_auth/firebase_auth.dart';

class UserProfile {
  String id;

  UserProfile.fromFirebase(User user) {
    id = user.uid;
  }
}
