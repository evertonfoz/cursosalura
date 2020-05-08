import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx07/presentation/mixins/presentation_mixin.dart';
import 'package:mobx07/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx07/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

import 'mobx/home_page_store.dart';
import 'shared_preferences/orientacao_total_pedido_preferences.dart';

class HomePage extends StatelessWidget with PresentationMixin {
  static const double messageBoxWidth = 200.0;
  static const double messageBoxHeight = 120.0;

  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();
  final List<Widget> _paginas = [
    ListaDeProdutosPage(),
    ProdutosSelecionadosPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(_homePageStore.tituloHomePage);
        }),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total Pedido:'),
              Observer(
                builder: (_) {
                  return gerarText(
                    texto: _homePageStore.totalPedido,
                    negrito: true,
                    cor: Colors.yellowAccent,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          FutureBuilder(
              future:
                  OrientacaoTotalPedidoPreferences.verificarSeJaLeuOrientacao(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (!snapshot.data)
                    return AbsorbPointer(
                      child: Opacity(
                          opacity: 0.3,
                          child: _paginas[_homePageStore.paginaAtual]),
                    );
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
            top: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Message(
                  triangleX1: 0.4 * messageBoxWidth,
                  triangleX2: 0.5 * messageBoxWidth,
                  triangleX3: 0.5 * messageBoxWidth,
                  triangleY1: messageBoxHeight * 0.2,
                  clipShadows: [ClipShadow(color: Colors.black)],
                  child: Container(
                    color: Colors.pink,
                    width: messageBoxWidth,
                    height: messageBoxHeight,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: messageBoxHeight * 0.2, left: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Veja sempre o total do pedido, no topo direito da tela.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FlatButton(
                              onPressed: () => print("Button 2"),
                              child: Text(
                                "Ok. Entendi!",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  width: 200.0,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/home/clippy.png',
                      width: 150.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
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
        );
      }),
    );
  }
}
