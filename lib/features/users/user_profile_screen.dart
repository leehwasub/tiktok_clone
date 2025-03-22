import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("nico"),
            actions: [
              IconButton(
                onPressed: () {},
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
                CircleAvatar(
                  radius: 50,
                  foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/3612017"),
                  child: Text("nico"),
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "@nico",
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
                FractionallySizedBox(
                  widthFactor: 0.33,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size12,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Sizes.size4),
                      ),
                    ),
                    child: Text(
                      "Follow",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.grey.shade200,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: TabBar(
                    labelPadding: EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                    ),
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(Icons.grid_4x4_rounded),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(FontAwesomeIcons.heart),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    children: [
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: 20,
                        padding: EdgeInsets.all(
                          Sizes.size6,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: Sizes.size10,
                          mainAxisSpacing: Sizes.size10,
                          childAspectRatio: 9 / 21,
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size4),
                              ),
                              child: AspectRatio(
                                aspectRatio: 9 / 16,
                                child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: "assets/images/imageTest.jpg",
                                    image:
                                        "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80"),
                              ),
                            ),
                            Gaps.v10,
                            Text(
                              "This is a very long caption for my tiktok that im upload just now currently.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gaps.v8,
                            DefaultTextStyle(
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage(
                                        "https://avatars.githubusercontent.com/u/3612017"),
                                  ),
                                  Gaps.h4,
                                  Expanded(
                                    child: Text(
                                      "My avatar is going to be very long",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Gaps.h4,
                                  FaIcon(
                                    FontAwesomeIcons.heart,
                                    size: Sizes.size16,
                                    color: Colors.grey.shade600,
                                  ),
                                  Gaps.h2,
                                  Text(
                                    "2.5M",
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Text("Page Two"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
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
