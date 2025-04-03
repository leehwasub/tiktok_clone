import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepositiory {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => _user != null;
  User? get _user => _firebaseAuth.currentUser;
}

final authRepo = Provider(
  (ref) => AuthenticationRepositiory(),
);
