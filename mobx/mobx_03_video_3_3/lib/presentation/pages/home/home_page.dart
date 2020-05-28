import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx03video33/presentation/mixins/presentation_mixin.dart';
import 'package:mobx03video33/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx03video33/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

import 'mobx/home_page_store.dart';

// Declaração para o uso do PresentationMixin em HomePage
class HomePage extends StatelessWidget with PresentationMixin {
  // Adaptação da declaração de _homePageStore em HomePage para recuperar a instância de HomePageStore
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

  // Declaração implementada no início da classe HomePage
  final formatacaoMonetaria = NumberFormat.simpleCurrency(locale: 'pt_BR');

  // Declaração da store e de uma lista com as duas páginas para navegação
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
        // Implementação de actions após o title de AppBar em HomePage
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
