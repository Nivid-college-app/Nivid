import 'package:Nivid/widgets/image_post.dart';
import 'package:Nivid/widgets/post_leading.dart';
import 'package:Nivid/widgets/post_trailing.dart';
import 'package:Nivid/widgets/text_post.dart';
import 'package:flutter/material.dart';
import 'package:Nivid/models/home_post.dart';
import 'package:Nivid/widgets/video_post.dart';

class HomeFeedScreen extends StatelessWidget {
  static const routeName = 'HomeFeedScreen';

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          cacheExtent: 0,
          itemCount: posts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0)
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 80,
                    child: Image.asset('assets/images/app_name.png')),
              );
            if (index == posts.length + 1)
              return Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 80),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('That\'s all for the day!\nThank you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
              );
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  PostLeading(posts[index - 1]),
                  posts[index - 1].isVideo
                      ? VideoPost(posts[index - 1])
                      : posts[index - 1].isText
                          ? TextPost(posts[index - 1])
                          : ImagePost(posts[index - 1]),
                  PostTrailing(posts[index - 1]),
                ],
              ),
            );
          }),
    );
  }
}
