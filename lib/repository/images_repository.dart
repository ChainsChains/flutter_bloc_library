import 'package:flutter_bloc_library/api/imageApiProvider.dart';
import 'package:flutter_bloc_library/api/models/my_image.dart';

class ImagesRepository {
  final imageApiProvider = ImageApiProvider();

  Future<List<MyImage>> getImages() => imageApiProvider.getImages();
}
