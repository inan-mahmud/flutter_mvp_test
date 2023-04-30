import 'package:base_view_model_app/home_presenter.dart';
import 'package:base_view_model_app/number_update_interface.dart';
import 'package:base_view_model_app/users/di/locator.dart';
import 'package:base_view_model_app/users/view/user_view.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    implements NumberUpdateInterface {
  late HomePresenter homePresenter;
  ValueNotifier<int> valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    homePresenter = HomePresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<int>(
              builder: (BuildContext context, int value, Widget? child) {
                return Text('$value');
              },
              valueListenable: valueNotifier,
              child: null,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => homePresenter.changeNumber(valueNotifier.value + 1),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void onUpdateNumber(int number) {
    valueNotifier.value = number;
  }
}
