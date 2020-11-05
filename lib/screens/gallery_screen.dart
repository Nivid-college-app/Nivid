import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  static const routeName = '\GalleryScreen';

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    return _isConnected
        ? Container()
        : Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/Google_photos.jpg'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        Text('Coming soon...', style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ),
          );
  }
}
