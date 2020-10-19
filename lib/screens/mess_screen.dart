import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:Nivid/widgets/mess_item.dart';
import 'package:Nivid/models/mess_menu_item.dart';

class MessScreen extends StatefulWidget {
  static const routeName = 'MessScreen';
  @override
  _MessScreenState createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  Size _size;
  int _selected;
  int _day = 0;

  @override
  void initState() {
    super.initState();
    if (DateTime.now().hour >= 10 && DateTime.now().hour < 15)
      _selected = 1;
    else if (DateTime.now().hour >= 15 && DateTime.now().hour < 21)
      _selected = 2;
    else
      _selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      initialIndex: _selected,
      child: Scaffold(
          appBar: PreferredSize(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30))),
                        context: context,
                        builder: (ctx) => daySelectGrid(ctx)),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 1),
                                blurRadius: 5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      width: _size.width,
                      height: 40,
                      margin: const EdgeInsets.only(
                          left: 8, bottom: 16, right: 8, top: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              DateFormat('EEEE').format(
                                  DateTime.now().add(Duration(days: _day))),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          Icon(Icons.arrow_circle_down, color: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: TabBar(
                      tabs: [
                        getTabButton('Breakfast', 0),
                        getTabButton('Lunch', 1),
                        getTabButton('Dinner', 2),
                      ],
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      labelColor: Colors.white,
                      unselectedLabelColor: Theme.of(context).accentColor,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).accentColor,
                          shape: BoxShape.rectangle),
                    ),
                  ),
                ],
              ),
              preferredSize: Size(_size.width, _size.height * 0.145)),
          body: TabBarView(
            children: [
              getTabViewWidget(),
              getTabViewWidget(),
              getTabViewWidget(),
            ],
          )),
    );
  }

  Container getTabButton(String title, int ind, {bool isMiddle = false}) {
    return Container(
        child: FittedBox(child: Text(title)), padding: EdgeInsets.all(8));
  }

  Widget getTabViewWidget() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: messMenuItems.length + 1,
      itemBuilder: (context, index) {
        if (index == messMenuItems.length)
          return Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 90, top: 20),
            child: FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                label: Text('Give your precious review.',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                icon: Icon(Icons.rate_review, size: 28),
                onPressed: () {}),
          );
        return MessItem(messMenuItems[index]);
      },
    );
  }

  Widget daySelectGrid(BuildContext ctx) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.75, crossAxisCount: 3),
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  _day = index;
                });
                Navigator.pop(ctx);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: _day == index
                            ? [
                                Theme.of(context).primaryColor.withOpacity(0.5),
                                Theme.of(context).primaryColor.withOpacity(0.7),
                                Theme.of(context).primaryColor.withOpacity(0.9),
                              ]
                            : [
                                Theme.of(context).accentColor.withOpacity(0.5),
                                Theme.of(context).accentColor.withOpacity(0.7),
                                Theme.of(context).accentColor.withOpacity(0.9),
                                // Theme.of(context).accentColor.withOpacity(0.9),
                                // Theme.of(context).accentColor.withOpacity(0.8),
                                // Theme.of(context).accentColor.withOpacity(0.7),
                              ],
                        tileMode: TileMode.mirror),
                    color: _day == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey[350],
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  DateFormat('EEEE')
                      .format(DateTime.now().add(Duration(days: index))),
                  style: TextStyle(
                      color: _day == index ? Colors.white : Colors.black,
                      fontSize: 16),
                ),
              ),
            ),
        itemCount: 7);
  }
}
