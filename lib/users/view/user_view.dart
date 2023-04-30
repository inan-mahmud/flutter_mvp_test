import 'package:base_view_model_app/users/models/user/user.dart';
import 'package:base_view_model_app/users/presenter/users_presenter.dart';
import 'package:base_view_model_app/users/view/user_view_listener.dart';
import 'package:flutter/material.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> implements UserViewListener {
  UsersPresenter? presenter;
  Future<List<User>>? usersFuture;

  @override
  void initState() {
    presenter = UsersPresenter(this);
    presenter!.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: usersFuture,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                final user = data[index];
                return ListTile(
                  title: Text(user.name!),
                );
              },
              itemCount: data.length,
            );
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }

  @override
  void onUserListLoaded(List<User> users) {
    usersFuture = Future.value(users);
    setState(() {});
  }
}
