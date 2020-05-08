import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'presentation/pages/home/mobx/home_page_store.dart';
import 'presentation/pages/home/shared_preferences/orientacao_total_pedido_preferences.dart';
import 'presentation/pages/login/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

class ArrowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Move')),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 50.0,
              height: 50.0,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'GO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 100.0),
              child: Arrow(
                clipShadows: [ClipShadow(color: Colors.black)],
                triangleHeight: 20.0,
                rectangleClipHeight: 10.0,
                child: Container(
                  width: 50.0,
                  height: 70.0,
                  color: Colors.pink,
                  child: Center(
                    child: Icon(
                      Icons.directions_bike,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: 100.0),
              child: Arrow(
                clipShadows: [ClipShadow(color: Colors.black)],
                edge: Edge.LEFT,
                triangleHeight: 20.0,
                rectangleClipHeight: 10.0,
                child: Container(
                  width: 50.0,
                  height: 70.0,
                  color: Colors.pink,
                  child: Center(
                    child: Icon(
                      Icons.directions_run,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.0),
              child: Arrow(
                clipShadows: [ClipShadow(color: Colors.black)],
                edge: Edge.TOP,
                triangleHeight: 20.0,
                rectangleClipHeight: 10.0,
                child: Container(
                  width: 70.0,
                  height: 50.0,
                  color: Colors.pink,
                  child: Center(
                    child: Icon(
                      Icons.directions_boat,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Arrow(
                clipShadows: [ClipShadow(color: Colors.black)],
                edge: Edge.BOTTOM,
                triangleHeight: 20.0,
                rectangleClipHeight: 10.0,
                child: Container(
                  width: 70.0,
                  height: 50.0,
                  color: Colors.pink,
                  child: Center(
                    child: Icon(
                      Icons.directions_bus,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
