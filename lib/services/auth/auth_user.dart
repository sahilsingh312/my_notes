import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;

  const AuthUser(this.isEmailVerified);

  factory AuthUser.fromFirebaseUser(User? user) {
    if (user == null) {
      return const AuthUser(false);
    }
    return AuthUser(user.emailVerified);
  }
}
