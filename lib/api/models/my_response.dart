

import 'package:flutter_bloc_library/api/models/user.dart';

class MyResponse {
  int totalCount;
  bool incompleteResults;
  List<User> items;

  MyResponse({this.totalCount, this.incompleteResults, this.items});

  MyResponse.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = new List<User>();
      json['items'].forEach((v) {
        items.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}