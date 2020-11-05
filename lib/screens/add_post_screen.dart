import 'dart:io';
import 'dart:convert';

import 'package:Nivid/global/variables.dart';
import 'package:Nivid/models/home_post.dart';
import 'package:Nivid/services/database.dart';
import 'package:Nivid/widgets/video_post.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Nivid/models/file_model.dart';
import 'package:Nivid/helpers/custom_slide_route.dart';
import 'package:Nivid/screens/select_image_video_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_crop/image_crop.dart';
import 'package:storage_path/storage_path.dart';

final _descriptionCtrl = TextEditingController();

class AddPostScreen extends StatefulWidget {
  static const routeName = '.\AddPostScreen';

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  List _files;
  List<File> _selectedFiles = [];
  bool _hasImageFiles = false;
  bool _hasVideoFiles = false;
  final _textCtrl = TextEditingController();

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Add Post'),
        actions: [
          FlatButton.icon(
              textColor: Colors.white,
              onPressed: () async {
                if (_textCtrl.text.isEmpty &&
                    !_hasImageFiles &&
                    !_hasVideoFiles) {
                  Fluttertoast.showToast(
                      msg:
                          'Text filed must not be empty, or\n Select either video or photos');
                } else {
                  HomePost post = HomePost(
                      id: null,
                      uid: userData.id,
                      userName: userData.name,
                      videoLink:
                          _hasVideoFiles ? _selectedFiles.first.path : null,
                      imagelinks: _hasImageFiles
                          ? _selectedFiles.map((e) => e.path).toList()
                          : [],
                      userIdsLiked: [],
                      isVideo: _hasVideoFiles,
                      isText: !_hasImageFiles && !_hasVideoFiles,
                      userIdsDisliked: [],
                      text: _textCtrl.text,
                      description: _descriptionCtrl.text.isEmpty
                          ? null
                          : _descriptionCtrl.text,
                      timePosted: null);
                  Database.uploadPost(context, post);
                  _textCtrl.clear();
                  _descriptionCtrl.clear();
                }
              },
              icon: Icon(Icons.send_outlined),
              label: Text('Send'))
        ],
      ),
      body: _hasImageFiles
          ? ImagePreview(selectedFiles: _selectedFiles)
          : _hasVideoFiles
              ? VideoPreview(selectedFiles: _selectedFiles)
              : ListView(
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
                                : AssetImage('assets/images/college.jpg'),
                            radius: 25,
                            backgroundColor: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(userData.college,
                            style: TextStyle(fontSize: 18)),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                          controller: _descriptionCtrl,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                              hintText: 'Say something about this text...',
                              border: InputBorder.none)),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                        controller: _textCtrl,
                        maxLines: 10,
                        decoration: InputDecoration(
                            hintText: 'What\'s on your mind?',
                            hintStyle:
                                TextStyle(fontSize: 24, color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FlatButton.icon(
                          splashColor: Colors.transparent,
                          onPressed: () async {
                            Fluttertoast.showToast(msg: 'Please wait!');
                            await getImagesorVideosPath();
                            Navigator.of(context)
                                .push(CustomSlideRoute(
                                    SelectImageVideoScreen(
                                        galleryFiles: _files),
                                    begin: Offset(1, 0)))
                                .then((value) {
                              _selectedFiles = value;
                              if (_selectedFiles != null &&
                                  _selectedFiles.isNotEmpty) {
                                setState(() {
                                  _hasImageFiles = true;
                                  _hasVideoFiles = false;
                                });
                              }
                            });
                          },
                          icon: Icon(Icons.add_a_photo,
                              color: Theme.of(context).primaryColor),
                          label: Text('Photo', style: TextStyle(fontSize: 16))),
                    ),
                    Divider(height: 0, thickness: 1),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FlatButton.icon(
                          splashColor: Colors.transparent,
                          onPressed: () async {
                            Fluttertoast.showToast(msg: 'Please wait!');
                            await getImagesorVideosPath(isVideo: true);
                            Navigator.of(context)
                                .push(CustomSlideRoute(
                                    SelectImageVideoScreen(
                                        galleryFiles: _files, isVideo: true),
                                    begin: Offset(1, 0)))
                                .then((value) {
                              _selectedFiles = value;
                              if (_selectedFiles != null &&
                                  _selectedFiles.isNotEmpty) {
                                setState(() {
                                  _hasImageFiles = false;
                                  _hasVideoFiles = true;
                                });
                              }
                            });
                          },
                          icon: Icon(Icons.videocam,
                              color: Theme.of(context).primaryColor),
                          label: Text('Video', style: TextStyle(fontSize: 16))),
                    ),
                    Divider(height: 0, thickness: 1),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FlatButton.icon(
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(Icons.color_lens,
                              color: Theme.of(context).primaryColor),
                          label: Text('Text color',
                              style: TextStyle(fontSize: 16))),
                    ),
                    Divider(height: 0, thickness: 1),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FlatButton.icon(
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(Icons.format_color_fill,
                              color: Theme.of(context).primaryColor),
                          label: Text('Background color',
                              style: TextStyle(fontSize: 16))),
                    ),
                    Divider(height: 0, thickness: 1),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FlatButton.icon(
                          splashColor: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(Icons.text_fields,
                              color: Theme.of(context).primaryColor),
                          label: Text('Text style',
                              style: TextStyle(fontSize: 16))),
                    )
                  ],
                ),
    );
  }
}

class VideoPreview extends StatelessWidget {
  const VideoPreview({Key key, @required List<File> selectedFiles})
      : _selectedFiles = selectedFiles,
        super(key: key);

  final List<File> _selectedFiles;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 27,
              child: CircleAvatar(
                  backgroundImage: userData.profileImageLink != null
                      ? NetworkImage(userData.profileImageLink)
                      : AssetImage('assets/images/college.jpg'),
                  radius: 25,
                  backgroundColor: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(userData.college, style: TextStyle(fontSize: 18)),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
              controller: _descriptionCtrl,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: 'Say something about this video...',
                  border: InputBorder.none)),
        ),
        SizedBox(height: 20),
        VideoPost(null, file: _selectedFiles.first)
      ],
    );
  }
}

class ImagePreview extends StatefulWidget {
  const ImagePreview({Key key, @required List<File> selectedFiles})
      : _selectedFiles = selectedFiles,
        super(key: key);

  final List<File> _selectedFiles;

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  int _ind = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 27,
              child: CircleAvatar(
                  backgroundImage: userData.profileImageLink != null
                      ? NetworkImage(userData.profileImageLink)
                      : AssetImage('assets/images/college.jpg'),
                  radius: 25,
                  backgroundColor: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(userData.college, style: TextStyle(fontSize: 18)),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
              controller: _descriptionCtrl,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: widget._selectedFiles.length > 1
                      ? 'Say something about these photos...'
                      : 'Say something about this photo...',
                  border: InputBorder.none)),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            CarouselSlider.builder(
                carouselController: _controller,
                itemCount: widget._selectedFiles.length,
                itemBuilder: (context, index) {
                  final _key = GlobalKey<CropState>();
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Crop(
                              key: _key,
                              alwaysShowGrid: true,
                              maximumScale: 1.0,
                              aspectRatio: 2.0,
                              image: FileImage(widget._selectedFiles[index]))),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.blueGrey,
                          child: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.done, size: 16),
                              onPressed: () async {
                                final area = _key.currentState.area;
                                final scale = _key.currentState.scale;
                                widget._selectedFiles[index] =
                                    await ImageCrop.cropImage(
                                        area: area,
                                        scale: scale,
                                        file: widget._selectedFiles[index]);
                                setState(() {});
                              }),
                        ),
                      )
                    ],
                  );
                },
                options: CarouselOptions(
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    initialPage: 0,
                    viewportFraction: 1,
                    aspectRatio: 2.0)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              FlatButton(
                  child: Text('prev'),
                  textColor: Colors.black,
                  onPressed: _ind > 0
                      ? () {
                          setState(() {
                            _controller.previousPage();
                            _ind = _ind - 1;
                          });
                        }
                      : null),
              FlatButton(
                  textColor: Colors.black,
                  child: Text('next'),
                  onPressed: _ind < widget._selectedFiles.length - 1
                      ? () {
                          setState(() {
                            _controller.nextPage();
                            _ind = _ind + 1;
                          });
                        }
                      : null)
            ]),
          ],
        )
      ],
    );
  }
}
