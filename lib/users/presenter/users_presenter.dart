import 'package:base_view_model_app/users/repository/users_repository.dart';
import 'package:base_view_model_app/users/view/user_view_listener.dart';

class UsersPresenter {
  final UserViewListener listener;

  UsersPresenter(this.listener);

  void fetchUsers() async {
    final repository = UsersRepository();
    final users = await repository.fetchUsers();
    listener.onUserListLoaded(users);
  }
}
