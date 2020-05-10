import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx11/presentation/mixins/presentation_mixin.dart';
import 'package:mobx11/presentation/pages/home/shared_preferences/orientacao_total_pedido_preferences.dart';
import 'package:mobx11/presentation/pages/home/widgets/dica_widget.dart';
import 'package:mobx11/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx11/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

import 'mobx/home_page_store.dart';
import 'widgets/animacao_flecha.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with PresentationMixin, SingleTickerProviderStateMixin {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

  final List<Widget> _paginas = [
    ListaDeProdutosPage(),
    ProdutosSelecionadosPage(),
  ];

  Animation<double> _animacao;
  AnimationController _controladorAnimacao;

  @override
  void initState() {
    super.initState();
    _controladorAnimacao =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animacao =
        Tween<double>(begin: -50, end: 300).animate(_controladorAnimacao)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controladorAnimacao.reset();
              _controladorAnimacao.forward();
            }
          });
    if (!_homePageStore.orientacaoJaLida) _controladorAnimacao.forward();
  }

  @override
  void dispose() {
    _controladorAnimacao.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return _homePageStore.orientacaoJaLida
              ? Text(_homePageStore.tituloHomePage)
              : AnimacaoFlecha(
                  animacao: _animacao,
                );
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
                child: DicaWidget(
                  funcaoParaRegistrarLeituraOrientacao: () async {
                    await OrientacaoTotalPedidoPreferences
                        .registrarLeituraOrientacao();
                    _controladorAnimacao.reset();
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
          onTap: (index) => _homePageStore.orientacaoJaLida
              ? _homePageStore.alternarPagina(novaPagina: index)
              : () {},
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
