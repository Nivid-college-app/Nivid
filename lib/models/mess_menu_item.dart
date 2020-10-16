import 'package:flutter/foundation.dart';
import 'package:Nivid/global/variables.dart';

class MessMenuItem {
  String id;
  String foodName;
  String imageLink;
  double rating;

  MessMenuItem(
      {@required this.id,
      @required this.foodName,
      @required this.imageLink,
      @required this.rating});

  MessMenuItem.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.foodName = doc['fn'];
    this.imageLink = doc['imgLnk'];
    this.rating = doc['rtng'];
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'fn': this.foodName,
        'imgLnk': this.imageLink,
        'rtng': this.rating,
      };
}

List<MessMenuItem> messMenuItems = [
  MessMenuItem(
      id: '1',
      foodName: 'Papad',
      imageLink: dummyImageLinks.first,
      rating: 3.5),
  MessMenuItem(
      id: '2',
      foodName: 'Chole masala',
      imageLink: dummyImageLinks.elementAt(1),
      rating: 4.1),
  MessMenuItem(
      id: '3',
      foodName: 'Rice',
      imageLink: dummyImageLinks.elementAt(2),
      rating: 4.5),
  MessMenuItem(
      id: '4',
      foodName: 'Aloo fry',
      imageLink: dummyImageLinks.elementAt(3),
      rating: 4.3),
  MessMenuItem(
      id: '5',
      foodName: 'Salad',
      imageLink: dummyImageLinks.elementAt(4),
      rating: 3.7),
  MessMenuItem(
      id: '6',
      foodName: 'Curd',
      imageLink: dummyImageLinks.elementAt(5),
      rating: 4.7),
  MessMenuItem(
      id: '7',
      foodName: 'Gulab jamun',
      imageLink: dummyImageLinks.last,
      rating: 5)
];
