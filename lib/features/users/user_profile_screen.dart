import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';
import 'package:tiktok_clone/features/users/widgets/avatar.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class UserProfileScreen extends ConsumerWidget {
  final String username;
  final String tab;

  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  void _onGearPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return ref.watch(usersProvider).when(
          data: (data) => Scaffold(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            body: SafeArea(
              child: DefaultTabController(
                initialIndex: tab == "likes" ? 1 : 0,
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        centerTitle: true,
                        title: Text(data.name),
                        actions: [
                          IconButton(
                            onPressed: () => _onGearPressed(context),
                            icon: FaIcon(
                              FontAwesomeIcons.gear,
                              size: Sizes.size20,
                            ),
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Gaps.v20,
                            Avatar(
                              name: data.name,
                              hasAvatar: data.hasAvatar,
                              uid: data.uid,
                            ),
                            Gaps.v20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "@${data.name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                                Gaps.h5,
                                FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  size: Sizes.size16,
                                  color: Colors.blue.shade500,
                                ),
                              ],
                            ),
                            Gaps.v24,
                            SizedBox(
                              height: Sizes.size60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RelationshipDataWidget(
                                    title: "Following",
                                    number: "37",
                                  ),
                                  VerticalDivider(
                                    width: Sizes.size40,
                                    thickness: Sizes.size1,
                                    color: Colors.grey.shade200,
                                    indent: Sizes.size14,
                                    endIndent: Sizes.size14,
                                  ),
                                  RelationshipDataWidget(
                                    title: "Followers",
                                    number: "10.5M",
                                  ),
                                  VerticalDivider(
                                    width: Sizes.size40,
                                    thickness: Sizes.size1,
                                    color: Colors.grey.shade200,
                                    indent: Sizes.size14,
                                    endIndent: Sizes.size14,
                                  ),
                                  RelationshipDataWidget(
                                    title: "Likes",
                                    number: "149.3M",
                                  ),
                                ],
                              ),
                            ),
                            Gaps.v14,
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: Breakpoints.sm,
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.67,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 7,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: Sizes.size48,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.circular(
                                              Sizes.size3),
                                        ),
                                        child: Text(
                                          'Follow',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Gaps.h6,
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        height: Sizes.size48,
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Sizes.size3),
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: Sizes.size1),
                                        ),
                                        child: FaIcon(FontAwesomeIcons.youtube),
                                      ),
                                    ),
                                    Gaps.h6,
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        height: Sizes.size48,
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Sizes.size3),
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: Sizes.size1),
                                        ),
                                        child:
                                            FaIcon(FontAwesomeIcons.arrowDown),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Gaps.v14,
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.size32,
                              ),
                              child: Text(
                                "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Gaps.v14,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.link,
                                  size: Sizes.size12,
                                ),
                                Gaps.h4,
                                Text(
                                  "https://nomadcoders.co",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Gaps.v20,
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        delegate: PersistentTabBar(),
                        pinned: true,
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      GridView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: 20,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: width > Breakpoints.xl ? 5 : 3,
                          crossAxisSpacing: Sizes.size2,
                          mainAxisSpacing: Sizes.size2,
                          childAspectRatio: 9 / 14,
                        ),
                        itemBuilder: (context, index) => Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 9 / 14,
                              child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: "assets/images/imageTest.jpg",
                                  image:
                                      "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"),
                            ),
                            Positioned(
                              bottom: Sizes.size2,
                              left: Sizes.size5,
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.play,
                                    size: Sizes.size14,
                                    color: Colors.white,
                                  ),
                                  Gaps.h4,
                                  Text(
                                    "4.1M",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            if (index % 5 == 0)
                              Positioned(
                                top: Sizes.size5,
                                left: Sizes.size5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Sizes.size6,
                                    vertical: Sizes.size2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size3),
                                  ),
                                  child: Text(
                                    "Pinned",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text("Page Two"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text("error"),
          ),
          loading: () => Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
  }
}

class RelationshipDataWidget extends StatelessWidget {
  final String title;
  final String number;

  const RelationshipDataWidget(
      {super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v3,
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
