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
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.post.imagelinks.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                    fit: BoxFit.fill,
                    width: size.width,
                    alignment: Alignment.center,
                    placeholder: AssetImage('assets/images/placeholder.webp'),
                    image: NetworkImage(widget.post.imagelinks[index]))),
          ),
          options: CarouselOptions(
              initialPage: 0,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  ind = index;
                });
              }),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: Card(
              color: Colors.black87,
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('${ind + 1} / ${widget.post.imagelinks.length}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
            ))
      ],
    );
  }
}
