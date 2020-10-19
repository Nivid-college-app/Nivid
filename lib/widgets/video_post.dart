import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:video_player/video_player.dart';
import 'package:Nivid/models/home_post.dart';

bool muteVolume = true;

class VideoPost extends StatefulWidget {
  final HomePost post;
  VideoPost(this.post);
  @override
  _VideoPostState createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  VideoPlayerController _videoController;
  Future<void> _initVideoPlayer;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.post.videoLink);
    _initVideoPlayer = _videoController.initialize();
    _videoController.setLooping(true);
    muteVolume ? _videoController.setVolume(0) : _videoController.setVolume(1);
    _videoController.setPlaybackSpeed(1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FutureBuilder(
          future: _initVideoPlayer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              _videoController.play();
              return Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController)),
                  MuteOrUnmuteControl(
                      videoController: _videoController, left: 4, bottom: 4),
                  PlayOrPauseControl(videoController: _videoController),
                ],
              );
            }
            return Container(
              height: 250,
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}

class PlayOrPauseControl extends StatefulWidget {
  const PlayOrPauseControl({@required this.videoController});
  final VideoPlayerController videoController;

  @override
  _PlayOrPauseControlState createState() => _PlayOrPauseControlState();
}

class _PlayOrPauseControlState extends State<PlayOrPauseControl> {
  bool _playing = true;
  Timer _timer;
  double _opacity = 1;

  void _playOrPauseVideo() {
    setState(() {
      _playing = !_playing;
      _opacity = 1;
    });
    _timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 0;
      });
      _timer.cancel();
    });
    _playing ? widget.videoController.play() : widget.videoController.pause();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 0;
      });
      _timer.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 350),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 700),
        height: _opacity == 0 ? 55 : 75,
        width: _opacity == 0 ? 55 : 75,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black45),
        child: FittedBox(
          child: IconButton(
              iconSize: 75,
              splashColor: Colors.transparent,
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              color: Colors.white,
              icon: Icon(_playing ? Icons.play_arrow : Icons.pause),
              onPressed: _playOrPauseVideo),
        ),
      ),
    );
  }
}

class MuteOrUnmuteControl extends StatefulWidget {
  MuteOrUnmuteControl(
      {@required this.videoController,
      this.left,
      this.bottom,
      this.right,
      this.top});

  final VideoPlayerController videoController;
  final double left;
  final double right;
  final double top;
  final double bottom;

  @override
  _MuteOrUnmuteControlState createState() => _MuteOrUnmuteControlState();
}

class _MuteOrUnmuteControlState extends State<MuteOrUnmuteControl> {
  Timer _timer;
  double _opacity = 1;

  void _muteOrUnmuteVolume() {
    if (widget.videoController.value.isPlaying) {
      setState(() {
        muteVolume = !muteVolume;
        _opacity = 1;
      });
      _timer = Timer(Duration(seconds: 1, milliseconds: 500), () {
        setState(() {
          _opacity = 0;
        });
        _timer.cancel();
      });
      muteVolume
          ? widget.videoController.setVolume(0)
          : widget.videoController.setVolume(1);
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        _opacity = 0;
      });
      _timer.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: widget.bottom,
        left: widget.left,
        right: widget.right,
        top: widget.top,
        child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 350),
            child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey[800],
                child: IconButton(
                    iconSize: 12,
                    splashColor: Colors.transparent,
                    alignment: Alignment.center,
                    color: Colors.white,
                    icon: Icon(muteVolume
                        ? FlutterIcons.volume_mute_faw5s
                        : FlutterIcons.volume_up_faw5s),
                    onPressed: _muteOrUnmuteVolume))));
  }
}
