import 'dart:io';
import 'package:Nivid/widgets/video_post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:Nivid/screens/camera_screen.dart';
import 'package:Nivid/helpers/custom_slide_route.dart';
import 'package:Nivid/helpers/custom_scale_route.dart';
import 'package:Nivid/screens/bottom_tabs_screen.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = '\AddPostScreen';

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen>
    with SingleTickerProviderStateMixin {
  Size _size;
  TabController _tabController;
  List<File> _selectedPhotos = [];
  File _selectedVideo;
  final _descriptionCtrl = TextEditingController();
  final _textPostCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Add post'),
        actions: [
          FlatButton.icon(
              textColor: Colors.white,
              onPressed: () => Navigator.of(context).pushReplacement(
                  CustomScaleRoute(BottomTabsScreen(),
                      alignment: Alignment.topLeft)),
              icon: Icon(Icons.send),
              label: Text('Send')),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(12),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text('Tell something about it',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            ),
            TextFormField(
              controller: _descriptionCtrl,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(hintText: 'Decsription'),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: _size.width,
              height: _size.height * 0.05,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, right: 30),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(30)),
                    isScrollable: false,
                    labelStyle: TextStyle(fontSize: 18),
                    unselectedLabelColor: Colors.blue[700],
                    controller: _tabController,
                    tabs: [Text('Photo'), Text('Video'), Text('Text')]),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: _size.width - 24,
                height: _size.height * 0.3,
                child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CarouselSlider.builder(
                          itemCount: _selectedPhotos.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _selectedPhotos.length)
                              return FlatButton.icon(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(CustomSlideRoute(CameraScreen(),
                                            begin: Offset(-1, 0)))
                                        .then((value) {
                                      print(value);
                                      if (value != null)
                                        setState(() {
                                          value.forEach((e) {
                                            _selectedPhotos.add(e);
                                          });
                                        });
                                    });
                                  },
                                  textColor: Colors.blue[700],
                                  splashColor: Colors.transparent,
                                  icon: Icon(Icons.add_a_photo_outlined,
                                      size: 28),
                                  label: Text(
                                      _selectedPhotos.length == 0
                                          ? 'Select photos'
                                          : 'Add more photos',
                                      style: TextStyle(fontSize: 18)));
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.file(_selectedPhotos[index],
                                        width: _size.width - 24,
                                        height: _size.height * 0.3,
                                        fit: BoxFit.fill),
                                  ),
                                  IconButton(
                                      color: Theme.of(context).errorColor,
                                      icon: Icon(Icons.cancel_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _selectedPhotos.removeAt(index);
                                        });
                                      }),
                                  Positioned(
                                      top: 4,
                                      right: 4,
                                      child: Card(
                                        color: Colors.black87,
                                        margin: EdgeInsets.all(10.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                              '${index + 1} / ${_selectedPhotos.length}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center),
                                        ),
                                      ))
                                ],
                              ),
                            );
                          },
                          options: CarouselOptions(
                              viewportFraction: 1,
                              enableInfiniteScroll: false)),
                      _selectedVideo == null
                          ? FlatButton.icon(
                              onPressed: () async {
                                // ignore: invalid_use_of_visible_for_testing_member
                                final file = await ImagePicker.platform
                                    .pickVideo(source: ImageSource.gallery);
                                setState(() {
                                  _selectedVideo = File(file.path);
                                });
                              },
                              textColor: Colors.blue[700],
                              splashColor: Colors.transparent,
                              icon: Icon(Icons.video_call_outlined, size: 28),
                              label: Text('Select video',
                                  style: TextStyle(fontSize: 18)))
                          : Stack(
                              children: [
                                Container(
                                  height: _size.height * 0.3,
                                  width: _size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[300]),
                                  child: VideoPost(null, file: _selectedVideo),
                                ),
                                IconButton(
                                    color: Theme.of(context).errorColor,
                                    icon: Icon(Icons.cancel_outlined),
                                    onPressed: () {
                                      setState(() {
                                        _selectedVideo = null;
                                      });
                                    })
                              ],
                            ),
                      TextFormField(
                        controller: _textPostCtrl,
                        minLines: 10,
                        maxLines: 12,
                        decoration: InputDecoration(
                            hintText: 'What\'s on your mind',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      )
                    ])),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
