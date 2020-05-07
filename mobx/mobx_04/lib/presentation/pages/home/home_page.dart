import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx04/presentation/pages/lista_de_produtos/listadeprodutos_page.dart';
import 'package:mobx04/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

import 'mobx/home_page_store.dart';

class HomePage extends StatelessWidget {
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
      ),
      body: Observer(builder: (_) {
        return _paginas[_homePageStore.paginaAtual];
      }),
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
