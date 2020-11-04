import 'package:flutter/foundation.dart';

enum FoodTime { Breakfast, Lunch, Dinner }

String toValueString(FoodTime type) {
  switch (type) {
    case FoodTime.Breakfast:
      return 'BREAKFAST';
    case FoodTime.Lunch:
      return 'LUNCH';
    case FoodTime.Dinner:
      return 'DINNER';
    default:
      return null;
  }
}

FoodTime toEnum(String type) {
  switch (type) {
    case 'BREAKFAST':
      return FoodTime.Breakfast;
    case 'LUNCH':
      return FoodTime.Lunch;
    case 'DINNER':
      return FoodTime.Dinner;
    default:
      return null;
  }
}

class MessMenuItem {
  String id;
  String foodName;
  FoodTime time;
  String imageLink;
  double rating;

  MessMenuItem(
      {@required this.id,
      @required this.foodName,
      @required this.time,
      @required this.imageLink,
      this.rating = 0});

  MessMenuItem.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.foodName = doc['fn'];
    this.time = toEnum(doc['tm']);
    this.imageLink = doc['imgLnk'];
    this.rating = doc['rtng'];
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'fn': this.foodName,
        'tm': toValueString(this.time),
        'imgLnk': this.imageLink,
        'rtng': this.rating,
      };
}

List<MessMenuItem> getSelectedTimeFood(List<MessMenuItem> list, FoodTime time) {
  return list.where((element) => element.time == time).toList();
}

List<MessMenuItem> messMenuItems = [
  MessMenuItem(
      id: '1',
      foodName: 'Papad',
      time: FoodTime.Breakfast,
      imageLink: null,
      rating: 3.5),
  MessMenuItem(
      id: '2',
      foodName: 'Chole masala',
      time: FoodTime.Breakfast,
      imageLink: null,
      rating: 4.1),
  MessMenuItem(
      id: '3',
      foodName: 'Rice',
      time: FoodTime.Lunch,
      imageLink: null,
      rating: 4.5),
  MessMenuItem(
      id: '4',
      foodName: 'Aloo fry',
      time: FoodTime.Lunch,
      imageLink: null,
      rating: 4.3),
  MessMenuItem(
      id: '5',
      foodName: 'Salad',
      time: FoodTime.Lunch,
      imageLink: null,
      rating: 3.7),
  MessMenuItem(
      id: '6',
      foodName: 'Curd',
      time: FoodTime.Dinner,
      imageLink: null,
      rating: 4.7),
  MessMenuItem(
      id: '7',
      foodName: 'Gulab jamun',
      time: FoodTime.Dinner,
      imageLink: null,
      rating: 5)
];
