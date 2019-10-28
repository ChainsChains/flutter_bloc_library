import 'package:flutter_bloc_library/bloc/user_search_bloc.dart';
import 'package:flutter_bloc_library/repository/gituser_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGitUserRepository extends Mock implements GitUserRepository {}

void main() {
  MockGitUserRepository repository;
  UserSearchBloc sut;

  setUp(() {
    repository = MockGitUserRepository();
  });

  tearDown(() {
    clearInteractions(repository);
    sut = null;
  });

  void stubSearchUsers(dynamic value) {
    when(repository.searchUsers('')).thenAnswer((_) => Future.value(value));
  }

  test(
      'On sumbitting users search query read from repository and emits a list to users stream',
      () async {
    final expected = [];

    stubSearchUsers(expected);

    sut = UserSearchBloc(repository);
    sut.submitUserQuery('');
    expect(sut.usersStream, emits(expected));
  });
}
