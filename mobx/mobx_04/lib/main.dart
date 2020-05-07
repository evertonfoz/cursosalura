import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'presentation/pages/home/mobx/home_page_store.dart';
import 'presentation/pages/login/login_page.dart';

void main() {
  GetIt.I.registerSingleton<HomePageStore>(HomePageStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: LoginPage(),
    );
  }
}
