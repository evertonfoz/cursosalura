import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx06/presentation/mixins/presentation_mixin.dart';
import 'package:mobx06/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx06/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

import 'mobx/home_page_store.dart';

class HomePage extends StatelessWidget with PresentationMixin {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();
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
                    texto:
                        formatacaoMonetaria.format(_homePageStore.totalPedido),
                    negrito: true,
                    cor: Colors.yellowAccent,
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return _paginas[_homePageStore.paginaAtual];
      }),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          iconSize: 48,
          currentIndex: _homePageStore.paginaAtual,
          onTap: (index) => _homePageStore.alternarPagina(novaPagina: index),
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.menu,
              ),
              title: new Text('Produtos'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.add_shopping_cart,
              ),
              title: new Text('Pedido'),
            ),
          ],
        );
      }),
    );
  }
}
