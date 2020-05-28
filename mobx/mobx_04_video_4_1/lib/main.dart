import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx04video41/presentation/pages/home/home_page.dart';

import 'presentation/pages/home/mobx/home_page_store.dart';

void main() {
  GetIt.I.registerSingleton<HomePageStore>(HomePageStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configuração de propriedade no MaterialApp, na classe MyApp no arquivo main.dart
      debugShowCheckedModeBanner: false,
      title: 'Alura - Curso MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      // Adaptação da propriedade home de MaterialApp para agilizar os testes
      home: HomePage(),
    );
  }
}
