import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx03video32/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx03video32/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

import 'mobx/home_page_store.dart';

class HomePage extends StatelessWidget {
  // Declaração da store e de uma lista com as duas páginas para navegação
  final HomePageStore _homePageStore = HomePageStore();
  final List<Widget> _paginas = [
    ListaDeProdutosPage(),
    ProdutosSelecionadosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Inserção de um título na AppBar de HomePage, com valor dependendo da ação do usuário
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(_homePageStore.tituloHomePage);
        }),
      ),
      // Adaptação do conteúdo de body para que renderize a página selecionada pelo usuário
      body: Observer(builder: (_) {
        return _paginas[_homePageStore.paginaAtual];
      }),
      // Implementação da propriedade bottomNavigationBar, no Scaffold
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          iconSize: 48,
          currentIndex: _homePageStore.paginaAtual,
          onTap: (index) => _homePageStore.alternarPagina(novaPagina: index),
          items: [
            _bottomNavigationBarItem(icone: Icons.menu, titulo: 'Produtos'),
            _bottomNavigationBarItem(
                icone: Icons.add_shopping_cart, titulo: 'Pedido'),
          ],
        );
      }),
    );
  }

  // Criação, abaixo do builder, do método que gerará os botões de opções de acesso
  _bottomNavigationBarItem({IconData icone, String titulo}) {
    return BottomNavigationBarItem(
      icon: new Icon(
        icone,
      ),
      title: new Text(titulo),
    );
  }
}
