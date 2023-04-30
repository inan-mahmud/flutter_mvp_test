import 'package:base_view_model_app/users/models/user/user.dart';

abstract class UserViewListener {
  void onUserListLoaded(List<User> users);
}
