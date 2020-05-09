import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx09/presentation/pages/produtos_selecionados/mobx/produtos_selecionados_store.dart';

import 'presentation/pages/home/mobx/home_page_store.dart';
import 'presentation/pages/home/shared_preferences/orientacao_total_pedido_preferences.dart';
import 'presentation/pages/login/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<ProdutosSelecionadosStore>(
      ProdutosSelecionadosStore());
  HomePageStore _homePageStore = HomePageStore();
  OrientacaoTotalPedidoPreferences.verificarSeJaLeuOrientacao().then((value) {
    if (value) _homePageStore.registrarLeituraOrientacao();
    GetIt.I.registerSingleton<HomePageStore>(_homePageStore);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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