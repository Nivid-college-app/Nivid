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
      key: ValueKey(widget.item.id),
      margin: const EdgeInsets.only(left: 14, right: 14, top: 8),
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
              borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
              child: widget.item.imageLink != null
                  ? FadeInImage(
                      height: _size.width * 0.2,
                      width: _size.width * 0.2,
                      fit: BoxFit.fill,
                      placeholder: AssetImage('assets/images/m3.png'),
                      image: NetworkImage(widget.item.imageLink))
                  : Image.asset(
                      'assets/images/m3.png',
                      height: _size.width * 0.2,
                      width: _size.width * 0.2,
                      fit: BoxFit.fill,
                    )),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(widget.item.foodName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                  splashColor: Colors.transparent,
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.favorite),
                                  color: _favourite ? Colors.red : Colors.grey,
                                  onPressed: () {
                                    setState(() {
                                      _favourite = !_favourite;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(children: [
                                  starRatingItem(1),
                                  starRatingItem(2),
                                  starRatingItem(3),
                                  starRatingItem(4),
                                  starRatingItem(5),
                                ]),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.only(
                                      left: 4, right: 4, top: 4, bottom: 3),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.star,
                                            size: 16, color: Colors.white),
                                        Text(
                                            '\t' +
                                                widget.item.rating.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold))
                                      ]))
                            ])
                      ])))
        ],
      ),
    );
  }
}
