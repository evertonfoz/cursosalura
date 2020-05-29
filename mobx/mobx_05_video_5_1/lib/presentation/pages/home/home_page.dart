import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx05video51/presentation/mixins/presentation_mixin.dart';
import 'package:mobx05video51/presentation/pages/lista_de_produtos/lista_de_produtos_page.dart';
import 'package:mobx05video51/presentation/pages/produtos_selecionados/produtos_selecionados_page.dart';

import 'mobx/home_page_store.dart';
import 'widgets/animacao_flecha_widget.dart';
import 'widgets/clippy_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Registramos o uso do Mixin SingleTickerProviderStateMixin na classe State para HomePage
class _HomePageState extends State<HomePage>
    with PresentationMixin, SingleTickerProviderStateMixin {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();
  final formatacaoMonetaria = NumberFormat.simpleCurrency(locale: 'pt_BR');

  final List<Widget> _paginas = [
    ListaDeProdutosPage(),
    ProdutosSelecionadosPage(),
  ];

  // Declaração das variáveis que serão utilizadas na animação, dentro da classe _HomePageState
  Animation<double> _animacao;
  AnimationController _controladorAnimacao;

  // Sobrescrita do método initState() para instanciar classes responsáveis pela animação e controle dela
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

    // Implementação a ser inserida antes do final de initState() para que a animação seja iniciada
    _controladorAnimacao.forward();
  }

  // Sobrescrita do método dispose() na classe _HomePageState, para liberar recursos utilizados para o controlador da animação
  @override
  void dispose() {
    _controladorAnimacao.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Adaptação da propriedade title para fazer uso do método _tituloAppBar()
        title: _tituloAppBar(),
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
        // Adaptação do builder do Observer do body de Scaffold para utilizar o Stack
        return Stack(
          children: [
            // Adaptação da renderização da página em exibição no body de HomePage para utilizar o método _conteudoAbaixoDaMensagemDoMascote()
            _conteudoAbaixoDaMensagemDoMascote(),
            // Widget Positioned, com a mensagem e mascote encapsulado pelo Visibilty, para exibir apenas enquanto a mensagem não for lida
            Visibility(
              visible: !_homePageStore.orientacaoJaLida,
              child: Positioned(
                right: 0,
                width: 250,
                top: 10,
                // Registro da função anônima a ser enviada para o ClippyWidget executar quando o botão de confirmação for pressionado
                child: ClippyWidget(
                  // Adaptação da função anônima para que registre fisicamente a leitura da orientação
                  funcaoParaRegistrarLeituraOrientacao: () {
                    _homePageStore.registrarLeituraOrientacao();
                  },
                ),
              ),
            ),
          ],
        );
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

  // Criação de um método que retornará o conteúdo a ser renderizado ém relação a página exibida em HomePage a ser implementado após o método _bottomNavigationBarItem
  _conteudoAbaixoDaMensagemDoMascote() {
    if (_homePageStore.orientacaoJaLida)
      return _paginas[_homePageStore.paginaAtual];
    else
      return AbsorbPointer(
        child:
            Opacity(opacity: 0.3, child: _paginas[_homePageStore.paginaAtual]),
      );
  }

  // Criação de um método, após o _conteudoAbaixoDaMensagemDoMascote(), que retornará o conteúdo a ser renderizado para o título
  _tituloAppBar() {
    return Observer(builder: (_) {
      if (_homePageStore.orientacaoJaLida)
        return Text(_homePageStore.tituloHomePage);
      else
        return AnimacaoFlechaWidget(
          animacao: _animacao,
        );
    });
  }
}
