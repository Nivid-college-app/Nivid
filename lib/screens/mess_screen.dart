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
  int _selected = 0;
  int _day = 0;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: DropdownButton(
                      underline: SizedBox(),
                      value: _day,
                      iconEnabledColor: Colors.blue,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).primaryColor),
                      items: [
                        DropdownMenuItem(child: Text('Monday\t'), value: 0),
                        DropdownMenuItem(child: Text('Tuesday\t'), value: 1),
                        DropdownMenuItem(child: Text('Wednesday\t'), value: 2),
                        DropdownMenuItem(child: Text('Thursday\t'), value: 3),
                        DropdownMenuItem(child: Text('Friday\t'), value: 4),
                        DropdownMenuItem(child: Text('Saturday\t'), value: 5),
                        DropdownMenuItem(child: Text('Sunday\t'), value: 6),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _day = value;
                        });
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tabButton(context, 0, 'Breakfast'),
                    tabButton(context, 1, 'Lunch'),
                    tabButton(context, 2, 'Dinner')
                  ],
                ),
              ],
            ),
            preferredSize: Size(_size.width, _size.height * 0.15)),
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

  Widget tabButton(
    BuildContext context,
    int index,
    String title,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: _size.width * 0.275,
        child: FittedBox(
            child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: _selected == index ? FontWeight.bold : null,
              fontSize: _selected == index ? 18 : 16),
        )),
        decoration: BoxDecoration(
            color: _selected == index
                ? Theme.of(context).primaryColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
