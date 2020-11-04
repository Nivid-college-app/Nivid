import 'package:flutter/foundation.dart';

class AppUser with ChangeNotifier {
  String id;
  String name;
  String email;
  String college;
  String collegeId;
  String password;
  bool isAdmin;
  DateTime startDate;
  String profileImageLink;

  AppUser(
      {@required this.id,
      @required this.name,
      @required this.email,
      this.password,
      @required this.college,
      @required this.collegeId,
      this.isAdmin = false,
      @required this.startDate,
      this.profileImageLink});

  AppUser.fromMap(Map<String, dynamic> doc) {
    this.id = doc['id'];
    this.name = doc['name'];
    this.email = doc['email'];
    this.password = doc['pwd'];
    this.college = doc['college'];
    this.collegeId = doc['clgId'];
    this.isAdmin = doc['isAdm'];
    this.startDate = doc['sd']?.toDate();
    this.profileImageLink = doc['pil'];
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'email': this.email,
        'pwd': this.password,
        'college': this.college,
        'clgId': this.collegeId,
        'isAdm': this.isAdmin,
        'sd': this.startDate,
        'pil': this.profileImageLink,
      };
}
