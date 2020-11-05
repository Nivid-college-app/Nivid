import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '\AboutUsScreen';
  static Size size;

  Widget getDeveloperProfileWidget(String name, String image, String link) {
    TapGestureRecognizer recognizer = TapGestureRecognizer();
    return Container(
      width: size.width * 0.5 - 4,
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        CircleAvatar(
            radius: 65,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              radius: 63,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(image),
            )),
        SizedBox(height: 10),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                recognizer: recognizer..onTap = () => launchProfileLink(link),
                text: name,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                children: [
                  TextSpan(
                      text: '\nStudent at\n',
                      children: [
                        TextSpan(
                            text: 'IIIT Kottayam',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16))
                      ],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14)),
                ]))
      ]),
    );
  }

  Future<void> launchProfileLink(String link) async {
    if (await canLaunch(link)) {
      await launch(link, enableJavaScript: true);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Developers')),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          children: [
            Row(children: [
              getDeveloperProfileWidget(
                  'Sai Bhavadeesh Yarlagadda',
                  'assets/images/bhavadeesh.jpg',
                  'https://www.linkedin.com/in/sai-bhavadeesh-yarlagadda-58200917b/'),
              getDeveloperProfileWidget(
                  'Nikhil Kumar Ghanghor',
                  'assets/images/nikhil.jpg',
                  'https://www.linkedin.com/in/nikhil-kumar-ghanghor-05210a170/'),
            ]),
            Row(children: [
              getDeveloperProfileWidget(
                  'Kaushal Samant',
                  'assets/images/kaushal.jpg',
                  'https://www.linkedin.com/in/kaushal-samant-8a527b19b/'),
              getDeveloperProfileWidget(
                  'Muskan Rana',
                  'assets/images/muskan.jpg',
                  'https://www.linkedin.com/in/muskan-rana-a3900917b/'),
            ]),
            getDeveloperProfileWidget(
                'Bhaskar Purohit',
                'assets/images/bhaskar.jpg',
                'https://www.linkedin.com/in/bhaskar-purohit-29856a192/'),
          ],
        ));
  }
}
