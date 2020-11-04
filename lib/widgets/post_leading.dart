import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:Nivid/global/methods.dart';
import 'package:Nivid/models/home_post.dart';
import 'package:Nivid/global/variables.dart';
import 'package:Nivid/services/database.dart';

class PostLeading extends StatefulWidget {
  final HomePost post;
  PostLeading(this.post);
  @override
  _PostLeadingState createState() => _PostLeadingState();
}

class _PostLeadingState extends State<PostLeading> {
  bool _expanded = false;
  String _time;
  TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  void initState() {
    super.initState();
    _time = convertDateToReadableString(widget.post.timePosted);
    _recognizer.onTap = () {
      setState(() {
        _expanded = true;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            contentPadding: const EdgeInsets.only(left: 8),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 22,
              child: FutureBuilder(
                future: Database.getCollegePicture(widget.post.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircularProgressIndicator(),
                        ));
                  return CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage: snapshot.data == null
                          ? AssetImage('assets/images/college.jpg')
                          : NetworkImage(snapshot.data));
                },
              ),
            ),
            title: Text(widget.post.userName,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle:
                Text(_time, style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: userData.isAdmin
                ? IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
                : null),
        if (widget.post.description != null)
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16, bottom: 8, right: 8),
            child: _expanded
                ? Linkify(
                    onOpen: (link) async {
                      if (await canLaunch(link.url)) {
                        await launch(link.url, enableJavaScript: true);
                      } else {
                        Fluttertoast.showToast(msg: 'Could not launch $link');
                      }
                    },
                    text: widget.post.description,
                    linkStyle: TextStyle(color: Colors.blue, fontSize: 15),
                    style: TextStyle(color: Colors.black, fontSize: 15))
                : widget.post.description.length > 100 ||
                        widget.post.description.split('\n').length > 2
                    ? RichText(
                        text: TextSpan(
                            text: widget.post.description.split('\n').length >
                                        2 &&
                                    (widget.post.description.split('\n')[0] +
                                                widget.post.description
                                                    .split('\n')[1])
                                            .length <
                                        100
                                ? widget.post.description.split('\n')[0] +
                                    '\n' +
                                    widget.post.description.split('\n')[1] +
                                    '...'
                                : widget.post.description.substring(0, 100) +
                                    '...',
                            style: TextStyle(color: Colors.black),
                            children: [
                            TextSpan(
                                text: ' more',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withAlpha(125),
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                                recognizer: _recognizer)
                          ]))
                    : Linkify(
                        onOpen: (link) async {
                          if (await canLaunch(link.url)) {
                            await launch(link.url);
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Could not launch $link');
                          }
                        },
                        text: widget.post.description,
                        linkStyle: TextStyle(color: Colors.blue, fontSize: 15),
                        style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
      ],
    );
  }
}
