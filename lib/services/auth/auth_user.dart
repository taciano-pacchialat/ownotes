import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

// abstracts the user from the FirebaseAuth.currentUser
// only the emailVerified field is needed
@immutable
class AuthUser {
  final bool isEmailVerified;

  const AuthUser({required this.isEmailVerified});

  factory AuthUser.fromFirebase(User user) =>
      AuthUser(isEmailVerified: user.emailVerified);
}
