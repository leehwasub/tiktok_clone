import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/utils.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepositiory _repositiory;

  @override
  FutureOr<void> build() {
    _repositiory = ref.read(authRepo);
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repositiory.signIn(email, password),
    );
    if (!context.mounted) return;

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go("/home");
    }
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
