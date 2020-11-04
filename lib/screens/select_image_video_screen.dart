import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:flutter/material.dart';

class SelectImageVideoScreen extends StatefulWidget {
  static const routeName = '.\SelectImageVideoScreen';
  final bool isVideo;
  final bool selectone;
  final List galleryFiles;
  SelectImageVideoScreen(
      {this.isVideo = false,
      @required this.galleryFiles,
      this.selectone = false});

  @override
  _SelectImageVideoScreenState createState() => _SelectImageVideoScreenState();
}

class _SelectImageVideoScreenState extends State<SelectImageVideoScreen> {
  List<bool> _isSelected = [];
  var _selected;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _selected = widget.galleryFiles.first;
    for (int i = 0; i < widget.galleryFiles.first.files.length; i++)
      _isSelected.add(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: DropdownButton(
            dropdownColor: Colors.black54,
            underline: SizedBox(),
            style: TextStyle(color: Colors.white),
            icon: Icon(Icons.arrow_circle_down_outlined, color: Colors.white),
            value: _selected,
            items: widget.galleryFiles
                .map((e) => DropdownMenuItem(child: Text(e.folder), value: e))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selected = value;
                _isSelected = [];
                for (int i = 0; i < _selected.files.length; i++)
                  _isSelected.add(false);
              });
            },
          ),
          actions: [
            _count == 0
                ? SizedBox()
                //  IconButton(
                //     icon: Icon(
                //         widget.isVideo ? Icons.videocam : Icons.photo_camera),
                //     onPressed: () {})
                : FlatButton.icon(
                    textColor: Colors.white,
                    onPressed: () {
                      List<File> selectedFiles = [];
                      int a = 0;
                      _isSelected.forEach((element) {
                        if (element)
                          selectedFiles.add(File(_selected.files[a]));
                        a += 1;
                      });
                      Navigator.pop(context, selectedFiles);
                    },
                    icon: Icon(Icons.done),
                    label: Text('OK'))
          ],
        ),
        body: GridView.builder(
          itemCount: _selected.files.length == 0 ? 1 : _selected.files.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) => _selected.files.length == 0
              ? Center(child: Text(widget.isVideo ? 'No videos' : 'No images'))
              : widget.isVideo
                  ? Padding(
                      padding: const EdgeInsets.all(2),
                      child: GestureDetector(
                        onTap: () {
                          final file = File(_selected.files[index]);
                          if (file.lengthSync() / 1000000 > 3)
                            Fluttertoast.showToast(msg: 'Size limit exceeded');
                          else {
                            if (widget.selectone)
                              Navigator.pop(context, file);
                            else
                              Navigator.pop(context, [file]);
                          }
                        },
                        child: FutureBuilder(
                            future: VideoThumbnail.thumbnailData(
                                video: _selected.files[index],
                                maxWidth: 100,
                                imageFormat: ImageFormat.PNG),
                            builder: (context, snapshot) {
                              if (snapshot.hasData)
                                return Container(
                                    child: Image.memory(snapshot.data,
                                        fit: BoxFit.cover));
                              return Container(color: Colors.grey);
                            }),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        if (widget.selectone)
                          Navigator.pop(context, File(_selected.files[index]));
                        else
                          setState(() {
                            _isSelected[index] = !_isSelected[index];
                            if (_isSelected[index])
                              _count += 1;
                            else
                              _count -= 1;
                          });
                      },
                      child: Container(
                          margin: EdgeInsets.all(2),
                          decoration: _isSelected[index]
                              ? BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 3))
                              : null,
                          child: Image.file(File(_selected.files[index]),
                              fit: BoxFit.cover))),
        ));
  }
}
