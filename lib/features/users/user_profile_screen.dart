import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          stretch: true,
          pinned: true,
          backgroundColor: Colors.teal,
          elevation: 1,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.fadeTitle,
              StretchMode.zoomBackground,
            ],
            background: Image.asset(
              "assets/images/imageTest.jpg",
              fit: BoxFit.cover,
            ),
            title: Text("Hello"),
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(),
          ),
          itemExtent: 100,
        ),
      ],
    );
  }
}
