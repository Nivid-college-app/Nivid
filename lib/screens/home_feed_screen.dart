import 'package:Nivid/widgets/image_post.dart';
import 'package:Nivid/widgets/text_post.dart';
import 'package:flutter/material.dart';
import 'package:Nivid/models/home_post.dart';
import 'package:Nivid/widgets/video_post.dart';
import 'package:intl/intl.dart';

class HomeFeedScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          controller: controller,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final postTime = posts[index].timePosted;
            final time = DateTime.now().difference(postTime) <
                    Duration(minutes: 59, seconds: 59)
                ? 'Posted ' +
                    DateTime.now().difference(postTime).inMinutes.toString() +
                    ' mins ago'
                : 'Posted on ${DateFormat('dd/MM/yyyy').format(postTime)} at ${postTime.hour}:${postTime.minute}';
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 28,
                        child: CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            backgroundImage: posts[index].userImageLink == null
                                ? AssetImage('assets/images/iiitk.jpg')
                                : NetworkImage(posts[index].userImageLink)),
                      ),
                      title: Text(posts[index].userName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(time,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: IconButton(
                          icon: Icon(Icons.more_vert), onPressed: () {}),
                    ),
                  ),
                  posts[index].isVideo
                      ? VideoPost(posts[index])
                      : posts[index].isText
                          ? TextPost(posts[index])
                          : ImagePost(posts[index]),
                  Row(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                      child: IconButton(
                          icon: Icon(Icons.thumb_up), onPressed: () {}),
                    ),
                    Text('${posts[index].userIdsLiked.length}'),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                      child: IconButton(
                          icon: Icon(Icons.thumb_down), onPressed: () {}),
                    ),
                    Text('${posts[index].userIdsDisliked.length}'),
                  ]),
                ],
              ),
            );
          }),
    );
  }
}
