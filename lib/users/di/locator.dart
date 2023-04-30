import 'package:base_view_model_app/users/api/api_client.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  final dio = buildDioClient('https://jsonplaceholder.typicode.com/');
  locator.registerLazySingleton<ApiClient>(() => ApiClient(dio));
}
