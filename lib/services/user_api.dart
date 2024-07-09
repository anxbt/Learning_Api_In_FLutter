import 'dart:convert';

import 'package:learning_api_in_flutter/user.dart';
import 'package:http/http.dart' as http;
import 'package:learning_api_in_flutter/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUser() async {
    print("function called");
    const url = "https://randomuser.me/api/?results=30";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      return User(
        cell: e["cell"],
        email: e["email"],
        gender: e["gender"],
        nat: e["nat"],
        phone: e["phone"],
        name: name,
      );
    }).toList();
    return users;
    print(json);
    print("completed");
  }
}