import 'package:Nivid/global/variables.dart';
import 'package:Nivid/models/home_post.dart';
import 'package:Nivid/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PostTrailing extends StatefulWidget {
  final HomePost post;
  PostTrailing(this.post);
  @override
  _PostTrailingState createState() => _PostTrailingState();
}

class _PostTrailingState extends State<PostTrailing> {
  bool _liked = false;
  bool _disLiked = false;

  void _onLike() {
    setState(() {
      _liked = !_liked;
      _disLiked = false;
    });
    Database.likePost(widget.post);
  }

  void _onDislike() {
    setState(() {
      _liked = false;
      _disLiked = !_disLiked;
    });
    Database.disLikePost(widget.post);
  }

  @override
  void initState() {
    super.initState();
    if (widget.post.userIdsLiked.contains(firebaseuser.uid))
      _liked = true;
    else if (widget.post.userIdsDisliked.contains(firebaseuser.uid))
      _disLiked = true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            padding: const EdgeInsets.only(left: 8),
            splashColor: Colors.transparent,
            color: _liked ? Theme.of(context).primaryColor : null,
            icon: Icon(
              _liked
                  ? FlutterIcons.thumbs_up_faw
                  : FlutterIcons.thumbs_o_up_faw,
            ),
            onPressed: _onLike),
        if (userData.isAdmin) Text('${widget.post.userIdsLiked.length}'),
        IconButton(
            padding: EdgeInsets.only(left: 8),
            splashColor: Colors.transparent,
            color: _disLiked ? Theme.of(context).primaryColor : null,
            icon: Icon(
              _disLiked
                  ? FlutterIcons.thumbs_down_faw
                  : FlutterIcons.thumbs_o_down_faw,
            ),
            onPressed: _onDislike),
        if (userData.isAdmin) Text('${widget.post.userIdsDisliked.length}'),
      ],
    );
  }
}
