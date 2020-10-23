import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Nivid/helpers/custom_scale_route.dart';
import 'package:Nivid/screens/bottom_tabs_screen.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = 'AddPostScreen';

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen>
    with SingleTickerProviderStateMixin {
  Size _size;
  TabController _tabController;
  final _descriptionCtrl = TextEditingController();
  final _textPostCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Add post')),
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(12),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text('Tell something about it',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            ),
            TextFormField(
              controller: _descriptionCtrl,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(hintText: 'Decsription'),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: _size.width,
              height: _size.height * 0.05,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, right: 30),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(30)),
                    isScrollable: false,
                    labelStyle: TextStyle(fontSize: 18),
                    unselectedLabelColor: Theme.of(context).accentColor,
                    controller: _tabController,
                    tabs: [Text('Photo'), Text('Video'), Text('Text')]),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: _size.width - 24,
                height: _size.height * 0.3,
                child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CarouselSlider.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/images/m3.png',
                                    width: _size.width - 24,
                                    height: _size.height * 0.3,
                                    fit: BoxFit.fill),
                              ),
                          options: CarouselOptions(viewportFraction: 1)),
                      Container(
                        height: _size.height * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300]),
                        child:
                            Image.asset('assets/images/videoplaceholder.webp'),
                      ),
                      TextFormField(
                        controller: _textPostCtrl,
                        minLines: 10,
                        maxLines: 12,
                        decoration: InputDecoration(
                            hintText: 'What\'s on your mind',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      )
                    ])),
            SizedBox(height: 30),
            FloatingActionButton.extended(
                onPressed: () => Navigator.of(context).pushReplacement(
                    CustomScaleRoute(BottomTabsScreen(),
                        alignment: Alignment.topLeft)),
                label: Text('Post', style: TextStyle(fontSize: 20)),
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
