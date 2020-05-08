import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx08/presentation/mixins/presentation_mixin.dart';
import 'package:mobx08/presentation/pages/home/shared_preferences/orientacao_total_pedido_preferences.dart';
import 'package:mobx08/presentation/pages/home/widgets/clippy_widget.dart';
import 'package:mobx08/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx08/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

import 'mobx/home_page_store.dart';

class HomePage extends StatelessWidget with PresentationMixin {
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
      body: Observer(builder: (_) {
        return Stack(
          children: [
            _homePageStore.orientacaoJaLida
                ? _paginas[_homePageStore.paginaAtual]
                : AbsorbPointer(
                    child: Opacity(
                        opacity: 0.3,
                        child: _paginas[_homePageStore.paginaAtual]),
                  ),
            Visibility(
              visible: !_homePageStore.orientacaoJaLida,
              child: Positioned(
                right: 0,
                width: 250,
                top: 10,
                child: ClippyWidget(
                  funcaoParaRegistrarLeituraOrientacao: () async {
                    await OrientacaoTotalPedidoPreferences
                        .registrarLeituraOrientacao();
                    _homePageStore.registrarLeituraOrientacao();
                  },
                ),
              ),
            ),
          ],
        );
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
