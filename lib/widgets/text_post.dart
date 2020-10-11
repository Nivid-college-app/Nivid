import 'package:Nivid/models/home_post.dart';
import 'package:flutter/material.dart';

class TextPost extends StatelessWidget {
  final HomePost post;
  TextPost(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Text(post.text, textAlign: TextAlign.center),
    );
  }
}
