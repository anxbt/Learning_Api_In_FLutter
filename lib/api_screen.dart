import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_api_in_flutter/services/Provider_Model.dart';
import 'package:learning_api_in_flutter/user.dart';
import 'package:learning_api_in_flutter/services/user_api.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(builder: (context, userProvider, child) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: userProvider.users.length,
          itemBuilder: (context, index) {
            final user = userProvider.users[index];
            final email = user.email;
            final color = user.gender == 'male' ? Colors.blue : Colors.pink;
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.phone),
              //tileColor: color,
            );
          },
        );
      }),
    );
  }

  // void fetchUsers() async {
  //   final response = await UserApi.fetchUser();
  //   setState(() {
  //     users = response;
  //   });
  // }
}