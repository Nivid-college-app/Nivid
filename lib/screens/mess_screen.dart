import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:Nivid/widgets/mess_item.dart';
import 'package:Nivid/models/mess_menu_item.dart';

class MessScreen extends StatefulWidget {
  static const routeName = 'MessScreen';
  @override
  _MessScreenState createState() => _MessScreenState();
}

class _MessScreenState extends State<MessScreen> {
  Size _size;
  int _selected = 0;
  int _day = 0;

  @override
  void initState() {
    super.initState();
    if (DateTime.now().hour > 10)
      _selected = 1;
    else if (DateTime.now().hour > 15)
      _selected = 2;
    else if (DateTime.now().hour > 21) _selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
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
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18)),
                        Icon(Icons.arrow_circle_down, color: Colors.blue),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: _size.width,
                  child: SnakeNavigationBar(
                    backgroundColor: Colors.transparent,
                    currentIndex: _selected,
                    snakeShape: SnakeShape.rectangle,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    selectedItemColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    snakeColor: Theme.of(context).accentColor,
                    onPositionChanged: (value) {
                      setState(() {
                        _selected = value;
                      });
                    },
                    items: [
                      tabSelectButton('Breakfast'),
                      tabSelectButton('Lunch'),
                      tabSelectButton('Dinner')
                    ],
                  ),
                ),
              ],
            ),
            preferredSize: Size(_size.width, _size.height * 0.145)),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: messMenuItems.length + 1,
          itemBuilder: (context, index) {
            if (index == messMenuItems.length)
              return Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 90, top: 20),
                child: FloatingActionButton.extended(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text('Give your precious review.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    icon: Icon(Icons.rate_review, size: 28),
                    onPressed: () {}),
              );
            return MessItem(messMenuItems[index]);
          },
        ));
  }

  GridView daySelectGrid(BuildContext ctx) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.5, crossAxisCount: 2),
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

  BottomNavigationBarItem tabSelectButton(String title) {
    return BottomNavigationBarItem(
        icon: Text(
      title,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ));
  }
}
