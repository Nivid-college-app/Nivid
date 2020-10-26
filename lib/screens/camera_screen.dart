import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:storage_path/storage_path.dart';
import 'package:camera/camera.dart';
import 'package:Nivid/models/file_model.dart';
import 'package:Nivid/helpers/custom_slide_route.dart';
import 'package:Nivid/screens/photo_gallery_screen.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = '\CameraScreen';
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<CameraDescription> _cameras;
  List<FileModel> _files;
  CameraController _cameraController;
  int _camPosition = 0;
  Size _size;
  List<bool> _selected = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    availableCameras().then((value) {
      _cameras = value;
      _cameraController =
          CameraController(_cameras[_camPosition], ResolutionPreset.medium);
      _cameraController.initialize().then((_) {
        if (!mounted) Navigator.pop(context);
        setState(() {});
      }).catchError((_) => Navigator.pop(context));
    }).catchError((_) => Navigator.pop(context));
    getImagePath();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    _cameraController?.dispose();
  }

  getImagePath() async {
    final strPth = await StoragePath.imagesPath;
    final images = jsonDecode(strPth) as List;
    _files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    for (int i = 0; i < _files.first.files.length; i++) _selected.add(false);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: _cameraController == null || !_cameraController.value.isInitialized
          ? Container(height: MediaQuery.of(context).size.height)
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(alignment: Alignment.bottomCenter, children: [
                  AspectRatio(
                      aspectRatio: _cameraController.value.aspectRatio,
                      child: CameraPreview(_cameraController)),
                  Positioned(
                    bottom: 32,
                    child: GestureDetector(
                        onTap: () async {
                          try {
                            final dir = await getTemporaryDirectory();
                            print(dir.path);
                            final dt = DateTime.now().toString();
                            await _cameraController
                                .takePicture(dir.path + '/$dt.jpeg');
                            Navigator.pop(
                                context, [File(dir.path + '/$dt.jpeg')]);
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Theme.of(context).accentColor,
                            ))),
                  ),
                  Positioned(
                    bottom: -8,
                    child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.keyboard_arrow_up, size: 32),
                        onPressed: () => Navigator.of(context)
                            .push(CustomSlideRoute(PhotoGalleryScreen(_files)))
                            .then((value) => Navigator.pop(context, value))),
                  ),
                  Positioned(
                      top: 8,
                      left: 8,
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (_camPosition == 0)
                              _camPosition = 1;
                            else
                              _camPosition = 0;
                            try {
                              _cameraController = CameraController(
                                  _cameras[_camPosition],
                                  ResolutionPreset.medium);
                              _cameraController.initialize().then((_) {
                                if (!mounted) return;
                                setState(() {});
                              }).catchError((_) {});
                            } catch (_) {}
                          },
                          icon: Icon(FlutterIcons.md_reverse_camera_ion,
                              size: 28))),
                  Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            List<File> imgFiles = [];
                            int i = 0;
                            _selected.forEach((e) {
                              if (e) imgFiles.add(File(_files.first.files[i]));
                              i += 1;
                            });
                            Navigator.pop(context, imgFiles);
                          },
                          icon: Icon(Icons.done, size: 28)))
                ]),
                Container(
                  color: Colors.white,
                  width: _size.width,
                  height: _size.height -
                      _size.width / _cameraController.value.aspectRatio,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: _files.first.files.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected[index] = !_selected[index];
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: _selected[index]
                              ? BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 3))
                              : null,
                          child: Image.file(File(_files.first.files[index]),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
