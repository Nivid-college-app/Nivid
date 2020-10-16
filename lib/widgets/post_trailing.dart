import 'package:Nivid/models/home_post.dart';
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
  }

  void _onDislike() {
    setState(() {
      _liked = false;
      _disLiked = !_disLiked;
    });
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
        Text('${widget.post.userIdsLiked.length}'),
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
        Text('${widget.post.userIdsDisliked.length}'),
      ],
    );
  }
}
