import 'package:flutter/foundation.dart';

class Student with ChangeNotifier {
  String id;
  String name;
  String email;
  String college;
  DateTime startDate;
  String profileImageLink;

  Student(
      {@required this.id,
      @required this.name,
      @required this.email,
      //@required
      this.college = 'IIIT Kottayam',
      @required this.startDate,
      this.profileImageLink});

  Student.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.name = doc['name'];
    this.email = doc['email'];
    this.college = doc['college'];
    this.startDate = doc['sd']?.toDate();
    this.profileImageLink = doc['pil'];
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'email': this.email,
        'college': this.college,
        'sd': this.startDate,
        'pil': this.profileImageLink,
      };
}
