import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:Nivid/models/news_feed.dart';
import 'package:Nivid/widgets/video_post.dart';
import 'package:video_player/video_player.dart';

class NewsDetailScreen extends StatelessWidget {
  static const routeName = '\NewsDetailScreen';
  final NewsFeed feed;
  NewsDetailScreen(this.feed);
  static Size size;
  static double top;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    top = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
                child: feed.isVideo
                    ? NewsVideo(size: size, url: feed.downloadLink)
                    : FadeInImage(
                        height: size.height * 0.5,
                        width: size.width,
                        fit: BoxFit.fill,
                        placeholder:
                            AssetImage('assets/images/placeholder.webp'),
                        image: NetworkImage(feed.downloadLink)),
              ),
              Positioned(
                  left: 10,
                  top: top * 1.25,
                  child: FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.black45,
                      foregroundColor: Colors.white,
                      onPressed: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back))),
              Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30)),
                    color: Colors.black38,
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          DateFormat('d MMMM yyyy').format(feed.timePosted) +
                              ' - ' +
                              toValueString(feed.type),
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(height: 10),
                      Text(feed.headLine,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'AbrilFatface')),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: feed.userImageLink == null
                                  ? AssetImage('assets/images/iiitk.jpg')
                                  : NetworkImage(feed.userImageLink)),
                          SizedBox(width: 10),
                          Text(feed.userName,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white))
                        ],
                      )
                    ],
                  )),
            ],
          ),
          SizedBox(height: 10),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Linkify(
                  text: feed.description,
                  style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'))),
        ],
      ),
    );
  }
}

class NewsVideo extends StatefulWidget {
  const NewsVideo({
    Key key,
    @required this.size,
    @required this.url,
  }) : super(key: key);
  final Size size;
  final String url;
  @override
  _NewsVideoState createState() => _NewsVideoState();
}

class _NewsVideoState extends State<NewsVideo> {
  VideoPlayerController _videoController;
  Future<void> _initVideoPlayer;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.url);
    _initVideoPlayer = _videoController.initialize();
    _videoController.setLooping(true);
    muteVolume = false;
    muteVolume ? _videoController.setVolume(0) : _videoController.setVolume(1);
    _videoController.setPlaybackSpeed(1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
    muteVolume = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: widget.size.height * 0.5),
        width: widget.size.width,
        alignment: Alignment.center,
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
                      videoController: _videoController, left: 8),
                  PlayOrPauseControl(videoController: _videoController),
                ],
              );
            }
            return Container(
              height: 250,
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ));
  }
}
