import 'package:flutter_bloc_library/api/models/my_image.dart';

class ImageList {
  List<MyImage> images;

  ImageList({this.images});

  factory ImageList.fromJson(List<dynamic> json) {
    return ImageList(
        images: json
            .map((e) => MyImage.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
