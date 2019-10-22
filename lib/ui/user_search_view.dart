
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_library/api/models/user.dart';
import 'package:flutter_bloc_library/bloc/bloc_provider.dart';
import 'package:flutter_bloc_library/bloc/user_search_bloc.dart';

import 'app_drawer.dart';

class UserSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = UserSearchBloc();
    return BlocProvider<UserSearchBloc>(
      bloc: bloc,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            actions: <Widget>[_buildSearch(bloc)], title: _buildTitle(bloc)),
        body: _buildSearchResults(bloc),
      ),
    );
  }

  Widget _buildSearchResults(UserSearchBloc bloc) {
    return StreamBuilder<List<User>>(
        stream: bloc.usersStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot.data);
          } else {
            return Text('Type something to search');
          }
        });
  }

  Widget buildList(List<User> list) {
    return ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int pos) {
          return Card(
            child: ListTile(
              title: Text(list[pos].login),
            ),
          );
        });
  }

  Widget _buildSearch(UserSearchBloc bloc) {
    return IconButton(
      icon: StreamBuilder<bool>(
          stream: bloc.searchState,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Icon(snapshot.data ? Icons.close : Icons.search);
            } else {
              return Icon(Icons.search);
            }
          }),
      onPressed: () {
        bloc.onSearchPressed();
      },
    );
  }

  Widget _buildTitle(UserSearchBloc bloc) {
    return StreamBuilder<bool>(
        stream: bloc.searchState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return _buildSearchInputField(bloc);
            } else {
              return _buildAppBarDefaultTitle();
            }
          } else {
            return _buildAppBarDefaultTitle();
          }
        });
  }

  Widget _buildSearchInputField(UserSearchBloc bloc) {
    return TextField(
      onChanged: (query) => bloc.submitUserQuery(query),
      decoration: InputDecoration(
          hintText: 'Search...', prefixIcon: Icon(Icons.search)),
    );
  }

  Widget _buildAppBarDefaultTitle() {
    return Text('Git Users');
  }
}
