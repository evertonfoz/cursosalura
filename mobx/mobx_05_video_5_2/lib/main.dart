import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx05video51/presentation/pages/home/home_page.dart';

import 'presentation/pages/home/mobx/home_page_store.dart';
import 'presentation/pages/home/shared_preferences/orientacao_total_pedido_preferences.dart';

// Adaptação do método main(), em main.dart para executar um método assíncrono, referente à leitura de ciência sobre o total de pedido, registro dela em HomePageStore e também da instância no contexto da aplicação
void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
