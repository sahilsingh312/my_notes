import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;

  const AuthUser({required this.isEmailVerified});

  factory AuthUser.fromFirebaseUser(User? user) {
    if (user == null) {
      return const AuthUser(isEmailVerified: false);
    }
    return AuthUser(isEmailVerified: user.emailVerified);
  }
}
