import 'dart:async';

import 'package:flutter_bloc_library/api/models/my_image.dart';
import 'package:flutter_bloc_library/bloc/bloc.dart';
import 'package:flutter_bloc_library/repository/images_repository.dart';

class MyGridBloc extends Bloc {
  final ImagesRepository _repository;
  final StreamController<List<MyImage>> _imagesController =
      StreamController<List<MyImage>>();

  Stream<List<MyImage>> get imageStream => _imagesController.stream;

  MyGridBloc(this._repository) {
    updateImages();
  }

  void updateImages() async {
    final images = await _repository.getImages();
    _imagesController.sink.add(images);
  }

  @override
  void dispose() {
    _imagesController.close();
  }
}
