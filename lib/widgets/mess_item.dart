import 'package:Nivid/models/mess_menu_item.dart';
import 'package:flutter/material.dart';

class MessItem extends StatefulWidget {
  final MessMenuItem item;
  MessItem(this.item);

  @override
  _MessItemState createState() => _MessItemState();
}

class _MessItemState extends State<MessItem> {
  Size _size;
  int _selectedStars = 0;
  bool _favourite = false;

  Widget starRatingItem(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedStars = index;
          });
        },
        onDoubleTap: () {
          setState(() {
            _selectedStars = 0;
          });
        },
        child: Icon(Icons.star,
            color: _selectedStars >= index
                ? Theme.of(context).primaryColor
                : Colors.grey[400]));
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 3, offset: Offset(0, 1), color: Colors.black45)
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
                height: _size.width * 0.2,
                width: _size.width * 0.2,
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/images/m3.png'),
                image: NetworkImage(widget.item.imageLink)),
          ),
          SizedBox(width: 10),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.item.foodName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(children: [
                      starRatingItem(1),
                      starRatingItem(2),
                      starRatingItem(3),
                      starRatingItem(4),
                      starRatingItem(5),
                    ]),
                  )
                ]),
          )),
          IconButton(
              icon: Icon(Icons.favorite),
              color: _favourite ? Theme.of(context).primaryColor : Colors.grey,
              onPressed: () {
                setState(() {
                  _favourite = !_favourite;
                });
              }),
        ],
      ),
    );
  }
}
