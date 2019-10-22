import 'dart:async';

import 'package:flutter_bloc_library/api/models/user.dart';
import 'package:flutter_bloc_library/api/userApiProvider.dart';



class GitUserRepository {
  final userApiProvider = UserApiProvider();

  Future<List<User>> searchUsers(String query) =>
      userApiProvider.getUsers(query);
}
