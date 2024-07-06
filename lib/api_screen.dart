import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_api_in_flutter/user.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          final color = user.gender == 'male' ? Colors.blue : Colors.pink;
          return ListTile(
            title: Text(user.name.first),
            subtitle: Text(user.phone),
            //tileColor: color,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        child: const Icon(Icons.add),
      ),
    );
  }

  void fetchUser() async {
    print("function called");
    const url = "https://randomuser.me/api/?results=30";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final transformed = results.map((e) {
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
    print("fetchuser called");
    setState(() {
      users = transformed;
    });
    print(json);
    print("completed");
  }
}