import 'dart:convert';

import 'package:flutter_bloc_library/api/models/my_image_list.dart';
import 'package:flutter_bloc_library/api/models/my_image.dart';
import 'package:http/http.dart' as http;

class ImageApiProvider {
  Future<List<MyImage>> getImages() async {
    final response = await http.get('https://picsum.photos/v2/list');

    if (response.statusCode == 200) {
      return ImageList.fromJson(jsonDecode(response.body)).images;
    } else {
      throw Exception('Failed to load Images. Code = ${response.statusCode}');
    }
  }
}
