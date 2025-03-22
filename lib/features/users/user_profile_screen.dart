import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          snap: true, //조금만 스크롤 내리고 터치를 해제하면 끝까지 내려옴
          floating: true, // 스크롤 올릴때 끝까지 안올려도 바가내려움
          stretch:
              true, //스크롤을 끝까지 올리고나서 밑으로 더끌어당길수있는 옵션. FlexibleSpaceBar로 효과를설정
          pinned: true, //스크롤을 올렸을때 CollapsedHeight이하로 사라지지않음
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
            childCount: 30,
            (context, index) => Container(
              color: Colors.amber[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
          ),
          itemExtent: 100,
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.blue[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: Sizes.size20,
            crossAxisSpacing: Sizes.size20,
            childAspectRatio: 1,
          ),
        ),
      ],
    );
  }
}
