import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
            ],
          ),
        )
      ],
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
