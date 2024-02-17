import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

// abstracts the user from the FirebaseAuth.currentUser
// only the emailVerified field is needed
@immutable
class AuthUser {
  final bool isEmailVerified;

  final String? email;

  const AuthUser({
    required this.email,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser(
        email: user.email,
        isEmailVerified: user.emailVerified,
      );
}
