import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '\AboutUsScreen';

  Widget getDeveloperProfileWidget(String name, String image) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
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
                                fontSize: 16)),
                        TextSpan(
                            text: '\nB-Tech [ 2018 - 2022 ]',
                            style: TextStyle(color: Colors.green))
                      ],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14)),
                ]))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Developers')),
        body: GridView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.75),
          children: [
            getDeveloperProfileWidget(
                'Muskan Rana', 'assets/images/bhaskar.jpg'),
            getDeveloperProfileWidget(
                'Bhaskar Purohit', 'assets/images/bhaskar.jpg'),
            getDeveloperProfileWidget(
                'Nikhil Kumar Ghanghor', 'assets/images/nikhil.jpg'),
            getDeveloperProfileWidget(
                'Kaushal Samanth', 'assets/images/kaushal.jpg'),
            getDeveloperProfileWidget(
                'Sai Bhavadeesh Yarlagadda', 'assets/images/bhavadeesh.jpg'),
          ],
        ));
  }
}
