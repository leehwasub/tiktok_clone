import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/inbox/models/message_model.dart';
import 'package:tiktok_clone/features/inbox/repos/messages_repo.dart';

class MessagesViewModel extends AsyncNotifier<void> {
  late final MessagesRepo _repo;

  @override
  FutureOr build() {
    _repo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text) async {
    final user = ref.read(authRepo).user;
    state = AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final message = MessageModel(
          text: text,
          userId: user!.uid,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );
        _repo.sendMessage(message);
      },
    );
  }
}

final messagesProvider = AsyncNotifierProvider<MessagesViewModel, void>(
  () => MessagesViewModel(),
);

//autoDispose하지않으면 채팅방 들어가서 나가도 계속 listten하는 상태가됨
final chatProvider = StreamProvider.autoDispose<List<MessageModel>>((ref) {
  final db = FirebaseFirestore.instance;
  return db
      .collection("chat_rooms")
      .doc("pqzt2QBFc0rubI6ws1X2")
      .collection("texts")
      .orderBy("createdAt")
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (doc) => MessageModel.fromJson(doc.data()),
            )
            .toList(),
      );
});
