import 'dart:io';
import 'dart:convert';

import 'package:Nivid/services/database.dart';
import 'package:Nivid/widgets/video_post.dart';
import 'package:flutter/material.dart';
import 'package:storage_path/storage_path.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:Nivid/global/variables.dart';
import 'package:Nivid/models/news_feed.dart';
import 'package:Nivid/models/file_model.dart';
import 'package:Nivid/helpers/custom_slide_route.dart';
import 'package:Nivid/screens/select_image_video_screen.dart';

class AddNewsScreen extends StatefulWidget {
  static const routeName = '\AddNewsScreen';

  @override
  _AddNewsScreenState createState() => _AddNewsScreenState();
}

class _AddNewsScreenState extends State<AddNewsScreen> {
  final _descriptionCtrl = TextEditingController();
  final _headlineCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Size size;
  NewsType _selected = NewsType.General;
  File _pickedFile;
  bool _isVideo = false;
  List _files;

  Widget _getTitleText(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
      child: Text(title,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
    );
  }

  Widget _getRadioButton(NewsType type) {
    return RadioListTile(
        dense: true,
        value: type,
        groupValue: _selected,
        title: Text(toValueString(type)),
        onChanged: _onRadioButtonChange);
  }

  void _onRadioButtonChange(NewsType value) {
    setState(() {
      _selected = value;
    });
  }

  Future<void> getImagesorVideosPath({bool isVideo = false}) async {
    final strPth =
        isVideo ? await StoragePath.videoPath : await StoragePath.imagesPath;
    final files = jsonDecode(strPth) as List;
    _files = isVideo
        ? files.map<VideoFileModel>((e) => VideoFileModel.fromJson(e)).toList()
        : files.map<FileModel>((e) => FileModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text('Add Post'), actions: [
        FlatButton.icon(
            textColor: Colors.white,
            onPressed: () async {
              if (_formKey.currentState.validate() && _pickedFile != null) {
                NewsFeed feed = NewsFeed(
                    id: null,
                    uid: firebaseuser.uid,
                    userImageLink: userData.profileImageLink,
                    userName: userData.name,
                    downloadLink: _pickedFile.path,
                    headLine: _headlineCtrl.text,
                    description: _descriptionCtrl.text,
                    type: _selected,
                    timePosted: null);
                Database.uploadNews(context, feed);
              } else if (_pickedFile == null)
                Fluttertoast.showToast(msg: 'No image / video file found');
            },
            icon: Icon(Icons.send_outlined),
            label: Text('send'))
      ]),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10),
          children: [
            SizedBox(height: 20),
            Row(children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 27,
                child: CircleAvatar(
                    backgroundImage: userData.profileImageLink != null
                        ? NetworkImage(userData.profileImageLink)
                        : AssetImage('assets/images/iiitk.jpg'),
                    radius: 25,
                    backgroundColor: Colors.white),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(userData.college, style: TextStyle(fontSize: 18)),
              )
            ]),
            _getTitleText('Head line', context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                  controller: _headlineCtrl,
                  validator: (value) {
                    if (value.isEmpty) return 'This must be filled';
                    return null;
                  },
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Head line of this article...',
                      border: InputBorder.none)),
            ),
            _getTitleText('Description', context),
            TextFormField(
                controller: _descriptionCtrl,
                validator: (value) {
                  if (value.isEmpty) return 'This must be filled';
                  return null;
                },
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'Description of this article...',
                    hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
            SizedBox(height: 20),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: size.width * 0.5 - 10,
                child: _pickedFile != null
                    ? Stack(
                        alignment: Alignment.topRight,
                        children: [
                          _isVideo
                              ? VideoPost(null, file: _pickedFile)
                              : Image.file(_pickedFile),
                          IconButton(
                              icon: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Icon(Icons.cancel,
                                      color: Theme.of(context).errorColor)),
                              onPressed: () {
                                setState(() {
                                  _pickedFile = null;
                                  _isVideo = null;
                                });
                              }),
                        ],
                      )
                    : Column(children: [
                        _getTitleText('Add a photo / Video', context),
                        FlatButton.icon(
                            onPressed: () async {
                              Fluttertoast.showToast(msg: 'Please wait!');
                              await getImagesorVideosPath();
                              Navigator.of(context)
                                  .push(CustomSlideRoute(
                                      SelectImageVideoScreen(
                                          galleryFiles: _files,
                                          selectone: true),
                                      begin: Offset(1, 0)))
                                  .then((value) {
                                setState(() {
                                  _pickedFile = value;
                                });
                              });
                            },
                            icon: Icon(Icons.add_a_photo,
                                color: Theme.of(context).primaryColor),
                            label: Text('Photo')),
                        FlatButton.icon(
                            onPressed: () async {
                              Fluttertoast.showToast(msg: 'Please wait!');
                              await getImagesorVideosPath(isVideo: true);
                              Navigator.of(context)
                                  .push(CustomSlideRoute(
                                      SelectImageVideoScreen(
                                          galleryFiles: _files,
                                          isVideo: true,
                                          selectone: true),
                                      begin: Offset(1, 0)))
                                  .then((value) {
                                setState(() {
                                  _isVideo = true;
                                  _pickedFile = value;
                                });
                              });
                            },
                            icon: Icon(Icons.videocam,
                                color: Theme.of(context).primaryColor),
                            label: Text('Video'))
                      ], crossAxisAlignment: CrossAxisAlignment.start),
              ),
              SizedBox(
                width: size.width * 0.5 - 10,
                child: Column(children: [
                  _getTitleText('Category :', context),
                  _getRadioButton(NewsType.General),
                  _getRadioButton(NewsType.Technical),
                  _getRadioButton(NewsType.Social)
                ], crossAxisAlignment: CrossAxisAlignment.start),
              )
            ])
          ],
        ),
      ),
    );
  }
}
