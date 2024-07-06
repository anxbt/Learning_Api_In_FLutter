import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final name = user['name']['first'];
          final title = user['name']['last'];
          final email = user['email'];
          final imageUrl = user['picture']['thumbnail'];
          return ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CircleAvatar(child: Image.network(imageUrl))),
            title: Text(name + " " + title),
            subtitle: Text(email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUser,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> fetchUser() async {
    print("function called");
    const url = "https://randomuser.me/api/?results=30";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print("fetchuser called");
    setState(() {
      users = json["results"];
    });
    print(json);
    print("ok");
  }
}