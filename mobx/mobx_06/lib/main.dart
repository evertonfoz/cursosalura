import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx06/presentation/pages/home/home_page.dart';
import 'package:mobx06/presentation/pages/lista_de_produtos/mobx/lista_de_produtos_page_store.dart';

import 'presentation/pages/home/mobx/home_page_store.dart';

void main() {
  GetIt.I.registerSingleton<HomePageStore>(HomePageStore());
  GetIt.I
      .registerSingleton<ListaDeProdutosPageStore>(ListaDeProdutosPageStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: HomePage(),
    );
  }
}
