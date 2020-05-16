import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx10/presentation/pages/home/home_page.dart';
import 'package:mobx10/presentation/pages/produtos_selecionados/mobx/produtos_selecionados_store.dart';

import 'presentation/pages/home/mobx/home_page_store.dart';
import 'presentation/pages/home/shared_preferences/orientacao_total_pedido_preferences.dart';
import 'presentation/pages/lista_de_produtos/mobx/lista_de_produtos_page_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I
      .registerSingleton<ListaDeProdutosPageStore>(ListaDeProdutosPageStore());
  GetIt.I.registerSingleton<ProdutosSelecionadosStore>(
      ProdutosSelecionadosStore());
  HomePageStore _homePageStore = HomePageStore();
  OrientacaoTotalPedidoPreferences.verificarSeJaLeuOrientacao().then((value) {
    if (value) _homePageStore.registrarLeituraOrientacao();
    GetIt.I.registerSingleton<HomePageStore>(_homePageStore);
  });

  Timer(Duration(seconds: 1), () => runApp(MyApp()));
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
