import 'package:flutter/cupertino.dart';
import 'package:learning_api_in_flutter/services/user_api.dart';
import 'package:learning_api_in_flutter/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void fetchUsers() async {
    _users = await UserApi.fetchUser();
    notifyListeners();
  }
}