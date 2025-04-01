import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utils.dart';

import '../../../../constants/gaps.dart';
import '../../../../constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  final ScrollController _scrollController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    _isWriting = false;
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: isDarkMode(context) ? null : Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: isDarkMode(context) ? null : Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: Text(S.of(context).commentTitle(22796)),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Scrollbar(
                  controller: _scrollController,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Gaps.v20,
                    padding: EdgeInsets.only(
                      top: Sizes.size10,
                      left: Sizes.size16,
                      right: Sizes.size16,
                      bottom: Sizes.size96 + Sizes.size20,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          child: Text("nico"),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "nico",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size14,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              Gaps.v3,
                              Text(
                                  "This is not it I've seen the smae thing but alos in a caveThis is not it I've seen the smae thing but alos in a cave"),
                            ],
                          ),
                        ),
                        Gaps.h10,
                        Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size20,
                              color: Colors.grey.shade500,
                            ),
                            Gaps.v2,
                            Text(
                              "52.2K",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: constraints.maxWidth,
                  child: BottomAppBar(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey.shade500,
                          foregroundColor: Colors.white,
                          child: Text("nico"),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size44,
                            child: TextField(
                              onTap: _onStartWriting,
                              minLines: null,
                              maxLines: null,
                              expands: true,
                              textInputAction: TextInputAction.newline,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                hintText: "Write a comment....",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: isDarkMode(context)
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade200,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: Sizes.size12,
                                  vertical: Sizes.size10,
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    right: Sizes.size14,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.at,
                                        color: isDarkMode(context)
                                            ? Colors.white
                                            : Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      Icon(
                                        FontAwesomeIcons.gift,
                                        color: isDarkMode(context)
                                            ? Colors.white
                                            : Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      Icon(
                                        FontAwesomeIcons.faceSmile,
                                        color: isDarkMode(context)
                                            ? Colors.white
                                            : Colors.grey.shade900,
                                      ),
                                      Gaps.h14,
                                      if (_isWriting)
                                        GestureDetector(
                                          onTap: _stopWriting,
                                          child: FaIcon(
                                            FontAwesomeIcons.circleArrowUp,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
