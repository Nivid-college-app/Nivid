import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Nivid/global/methods.dart';
import 'package:Nivid/models/home_post.dart';

class PostLeading extends StatefulWidget {
  final HomePost post;
  PostLeading(this.post);
  @override
  _PostLeadingState createState() => _PostLeadingState();
}

class _PostLeadingState extends State<PostLeading> {
  bool _expanded = false;
  Size _size;
  String _desc = '';
  String _time;
  TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    _time = convertDateToReadableString(widget.post.timePosted);
    if (widget.post.description.split('\n').length == 1) {
      _desc = widget.post.description.split('\n')[0];
    } else if (widget.post.description.split('\n').length > 1)
      _desc = widget.post.description.split('\n')[0] +
          '\n' +
          widget.post.description.split('\n')[1].substring(0,
              widget.post.description.split('\n')[1].length > 25 ? 25 : null) +
          '...';
    _recognizer.onTap = () {
      setState(() {
        _expanded = true;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
            contentPadding: const EdgeInsets.only(left: 8),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 22,
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  backgroundImage: widget.post.userImageLink == null
                      ? AssetImage('assets/images/iiitk.jpg')
                      : NetworkImage(widget.post.userImageLink)),
            ),
            title: Text(widget.post.userName,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle:
                Text(_time, style: TextStyle(fontWeight: FontWeight.bold)),
            trailing:
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {})),
        if (widget.post.description != null)
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16, bottom: 8, right: 8),
            child: _expanded
                ? RichText(
                    text: TextSpan(
                        text: widget.post.description,
                        style: TextStyle(color: Colors.black, fontSize: 14)))
                : RichText(
                    text: TextSpan(
                        text: _size.width * 1.5 <=
                                    widget.post.description.length * 6 &&
                                widget.post.description.split('\n').length == 1
                            ? _desc.substring(0, 100) + '...'
                            : _desc,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                        if (_size.width * 1.5 <=
                                widget.post.description.length * 6 ||
                            widget.post.description.split('\n').length > 1)
                          TextSpan(
                              text: ' more',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withAlpha(125),
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal),
                              recognizer: _recognizer)
                      ])),
          ),
      ],
    );
  }
}
