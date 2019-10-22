import 'dart:async';

import 'package:flutter_bloc_library/api/models/user.dart';
import 'package:flutter_bloc_library/bloc/bloc.dart';
import 'package:flutter_bloc_library/repository/gituser_repository.dart';

class UserSearchBloc implements Bloc {
  final _repository = GitUserRepository();
  final _usersController = StreamController<List<User>>();
  final _searchStateController = StreamController<bool>();

  Stream<List<User>> get usersStream => _usersController.stream;

  Stream<bool> get searchState => _searchStateController.stream;

  bool _searchStateValue = false;

  void submitUserQuery(String query) async {
    final List<User> results = await _repository.searchUsers(query);
    _usersController.sink.add(results);
  }

  void onSearchPressed() {
    _searchStateValue = !_searchStateValue;
    if (!_searchStateValue) _clearUsersList();
    _searchStateController.sink.add(_searchStateValue);
  }

  void _clearUsersList() {
    _usersController.add([]);
  }

  @override
  void dispose() {
    _usersController.close();
    _searchStateController.close();
  }
}
