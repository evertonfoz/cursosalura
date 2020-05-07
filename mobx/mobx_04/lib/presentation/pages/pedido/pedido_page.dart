import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx04/presentation/pages/home/mobx/home_page_store.dart';
import 'package:mobx04/presentation/pages/pedido/widgets/listtile_produtos_selecionados_widget.dart';

class PedidoPage extends StatelessWidget {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8),
          itemCount: _homePageStore.produtosSelecionados.length,
          itemBuilder: (context, index) {
            return ListTileParaProdutosSelecionadosWidget(
              produtoPedidoStore: _homePageStore.produtosSelecionados[index],
            );
          });
    });
  }
}
