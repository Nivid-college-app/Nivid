import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:Nivid/models/home_post.dart';

class VideoPost extends StatefulWidget {
  final HomePost post;
  VideoPost(this.post);
  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  VideoPlayerController _videoController;
  Future<void> _initVideoPlayer;
  bool _playing = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.post.videoLink);
    _initVideoPlayer = _videoController.initialize();
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initVideoPlayer,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: GestureDetector(
                  onTap: () {
                    _playing
                        ? _videoController.pause()
                        : _videoController.play();
                    _playing = !_playing;
                  },
                  child: VideoPlayer(_videoController)));
        }
        return Container(
          height: 250,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
