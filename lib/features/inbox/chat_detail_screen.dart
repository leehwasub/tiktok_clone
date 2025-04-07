import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/inbox/view_models/messages_view_model.dart';
import 'package:tiktok_clone/features/users/repos/user_repo.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  static const String routeName = "chatDetail";
  static const String routeURL = ":chatId";
  final String chatId;
  const ChatDetailScreen({
    super.key,
    required this.chatId,
  });

  @override
  ChatDetailScreenState createState() => ChatDetailScreenState();
}

class ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  void _onSendPress() {
    final text = _textEditingController.text;
    if (text == "") {
      return;
    }
    ref.read(messagesProvider.notifier).sendMessage(text);
    _textEditingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(messagesProvider).isLoading;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size16,
          leading: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/3612017"),
                child: Text("nico"),
              ),
              Positioned(
                right: -Sizes.size3,
                bottom: -Sizes.size3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.size20),
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: Sizes.size3,
                    ),
                  ),
                  width: Sizes.size20,
                  height: Sizes.size20,
                ),
              ),
            ],
          ),
          title: Text(
            "nico",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text("Active now"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ref.watch(chatProvider).when(
                data: (data) {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size20,
                      horizontal: Sizes.size14,
                    ),
                    itemBuilder: (context, index) {
                      final message = data[index];
                      final isMine =
                          message.userId == ref.read(authRepo).user!.uid;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: isMine
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                              Sizes.size14,
                            ),
                            decoration: BoxDecoration(
                              color: isMine
                                  ? Colors.blue
                                  : Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  Sizes.size20,
                                ),
                                topRight: Radius.circular(
                                  Sizes.size20,
                                ),
                                bottomLeft: Radius.circular(
                                  isMine ? Sizes.size20 : Sizes.size5,
                                ),
                                bottomRight: Radius.circular(
                                  isMine ? Sizes.size5 : Sizes.size20,
                                ),
                              ),
                            ),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Gaps.v10,
                    itemCount: data.length,
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Sizes.size20),
                            topLeft: Radius.circular(Sizes.size20),
                            topRight: Radius.circular(Sizes.size20),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(
                            right: Sizes.size12,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FaIcon(FontAwesomeIcons.faceGrin),
                            ],
                          ),
                        ),
                        hintText: "Send a Message...",
                        contentPadding: EdgeInsets.only(
                          left: Sizes.size14,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h20,
                  Container(
                    padding: EdgeInsets.all(Sizes.size10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: isLoading ? null : _onSendPress,
                      icon: FaIcon(isLoading
                          ? FontAwesomeIcons.hourglass
                          : FontAwesomeIcons.paperPlane),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
