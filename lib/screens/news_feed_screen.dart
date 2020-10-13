import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  static const routeName = 'NewsFeedScreen';
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: ListView.builder(itemBuilder: (context, index) => Container(child: Text(''),)));
  }
}
