import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx04/core/presentation/shared_preferences/orientacao_total_pedido_preferences.dart';
import 'package:mobx04/presentation/pages/home/mobx/home_page_store.dart';
import 'package:mobx04/presentation/pages/lista_de_produtos/listadeprodutos_page.dart';
import 'package:mobx04/presentation/pages/pedido/pedido_page.dart';

class HomePage extends StatelessWidget {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();
  final List<Widget> _paginas = [
    ListaDeProdutosPage(),
    PedidoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_homePageStore.tituloHomePage),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Pedido:'),
                Text(
                  '${_homePageStore.totalPedido}',
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            FutureBuilder(
                future: OrientacaoTotalPedidoPreferences
                    .verificarSeJaLeuOrientacao(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data)
                      return AbsorbPointer(
                          child: _paginas[_homePageStore.paginaAtual]);
                    else
                      return _paginas[_homePageStore.paginaAtual];
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Positioned(
              right: 0,
              width: 250,
              child: RaisedButton(
                onPressed: () => print("Button 2"),
                child: Text("Button 2"),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _homePageStore.paginaAtual,
          onTap: (index) => _homePageStore.alternarPagina(novaPagina: index),
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.menu,
                size: 48,
              ),
              title: new Text('Produtos'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.add_shopping_cart,
                size: 48,
              ),
              title: new Text('Pedido'),
            ),
          ],
        ),
      );
    });
  }
}