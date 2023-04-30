import 'package:base_view_model_app/users/api/api_client.dart';
import 'package:base_view_model_app/users/di/locator.dart';
import 'package:base_view_model_app/users/models/user/user.dart';

class UsersRepository {
  Future<List<User>> fetchUsers() async {
    final client = locator.get<ApiClient>();
    return await client.getUsers();
  }
}
