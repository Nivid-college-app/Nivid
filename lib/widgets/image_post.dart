import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Nivid/models/home_post.dart';

class ImagePost extends StatefulWidget {
  final HomePost post;
  ImagePost(this.post);

  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  Size size;
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return CarouselSlider(
      items: widget.post.imagelinks
          .map(
            (image) => Stack(
              alignment: Alignment.center,
              children: [
                FadeInImage(
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    placeholder: AssetImage('assets/images/app_icon.png'),
                    image: NetworkImage(image)),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Card(
                      color: Colors.black87,
                      margin: EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                            '${ind + 1} / ${widget.post.imagelinks.length}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                    ))
              ],
            ),
          )
          .toList(),
      options: CarouselOptions(
          initialPage: 0,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              ind = index;
            });
          }),
    );
  }
}
