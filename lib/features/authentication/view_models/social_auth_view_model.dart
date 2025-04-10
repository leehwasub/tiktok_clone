import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/utils.dart';

class SocialAuthViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepositiory _repositiory;

  @override
  FutureOr<void> build() {
    _repositiory = ref.read(authRepo);
  }

  Future<void> githubSignIn(BuildContext context) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _repositiory.githubSignIn(),
    );
    if (!context.mounted) return;

    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go("/home");
    }
  }
}

final socialAuthProvider = AsyncNotifierProvider<SocialAuthViewModel, void>(
  () => SocialAuthViewModel(),
);
