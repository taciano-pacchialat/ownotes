import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

// abstracts the user from the FirebaseAuth.currentUser
// only the emailVerified field is needed
@immutable
class AuthUser {
  final bool isEmailVerified;
  final String id;
  final String email;

  const AuthUser({
    required this.id,
    required this.email,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser(
        id: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified,
      );
}
