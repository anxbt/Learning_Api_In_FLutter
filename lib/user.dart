import 'package:learning_api_in_flutter/user.dart';
import 'package:learning_api_in_flutter/user_name.dart';

class User {
  final String gender;
  final String email;
  final String nat;
  final String phone;
  final String cell;
  final UserName name;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
  });

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}