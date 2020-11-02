import 'package:flutter/material.dart';
import 'package:Nivid/models/home_post.dart';
import 'package:Nivid/widgets/text_post.dart';
import 'package:Nivid/widgets/video_post.dart';
import 'package:Nivid/widgets/image_post.dart';
import 'package:Nivid/widgets/post_leading.dart';
import 'package:Nivid/widgets/post_trailing.dart';

class HomeFeedScreen extends StatefulWidget {
  static const routeName = '\HomeFeedScreen';

  @override
  _HomeFeedScreenState createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  Future<void> onRefresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: FutureBuilder(
          future: getAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Scrollbar(
                child: ListView.builder(
                    cacheExtent: 0,
                    itemCount: snapshot.data.length + 2,
                    itemBuilder: (context, index) {
                      if (index == 0)
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 80,
                              child: Image.asset('assets/images/app_name.png')),
                        );
                      if (index == snapshot.data.length + 1)
                        return Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 120),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                                snapshot.data.length == 0
                                    ? 'No posts to show!\nThank you'
                                    : 'No more posts!\nThank you',
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
                            PostLeading(snapshot.data[index - 1]),
                            snapshot.data[index - 1].isVideo
                                ? VideoPost(snapshot.data[index - 1])
                                : snapshot.data[index - 1].isText
                                    ? TextPost(snapshot.data[index - 1])
                                    : ImagePost(snapshot.data[index - 1]),
                            PostTrailing(snapshot.data[index - 1]),
                          ],
                        ),
                      );
                    }),
              );
            else if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else
              return Center(child: Text('something went wrong!'));
          }),
    );
  }
}
