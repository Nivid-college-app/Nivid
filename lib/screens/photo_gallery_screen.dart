import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Nivid/models/file_model.dart';

class PhotoGalleryScreen extends StatefulWidget {
  final List<FileModel> files;
  PhotoGalleryScreen(this.files);
  @override
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  FileModel _selected;
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    _selected = widget.files.first;
    for (int i = 0; i < widget.files.first.files.length; i++)
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
          icon: Icon(Icons.arrow_circle_down_outlined, color: Colors.blue),
          value: _selected,
          items: widget.files
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
          FlatButton.icon(
              textColor: Colors.white,
              onPressed: () {
                List<File> selectedFiles = [];
                int a = 0;
                _isSelected.forEach((element) {
                  if (element) selectedFiles.add(File(_selected.files[a]));
                  a += 1;
                });
                Navigator.pop(context, selectedFiles);
              },
              icon: Icon(Icons.done),
              label: Text('Done'))
        ],
      ),
      body: GridView.builder(
          itemCount: _selected.files.length == 0 ? 1 : _selected.files.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) => _selected.files.length == 0
              ? Center(child: Text('No images'))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelected[index] = !_isSelected[index];
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: _isSelected[index]
                          ? BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 3))
                          : null,
                      child: Image.file(File(_selected.files[index]),
                          fit: BoxFit.cover)))),
    );
  }
}
