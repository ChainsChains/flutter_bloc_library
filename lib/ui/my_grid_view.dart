import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_library/api/models/my_image.dart';
import 'package:flutter_bloc_library/bloc/my_grid_bloc.dart';
import 'package:flutter_bloc_library/repository/images_repository.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = MyGridBloc(ImagesRepository());
    return StreamBuilder<List<MyImage>>(
        stream: bloc.imageStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildGrid(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _buildGrid(List<MyImage> data) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) => Container(
        color: Colors.green,
        child: _buildGridItem(data[index]),
      ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  Widget _buildGridItem(MyImage image) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: image.downloadUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
      ),
    );
  }
}
