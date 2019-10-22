import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/my_response.dart';
import 'models/user.dart';

class UserApiProvider {
  Future<List<User>> getUsers(String query) async {
    final response = await http.get('https://api.github.com/search/users?&q=$query');

    if (response.statusCode == 200) {
      return MyResponse.fromJson(jsonDecode(response.body)).items;
    } else {
      throw Exception('Failed to load Users. Code = ${response.statusCode}');
    }
  }
}