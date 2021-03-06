import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'mobx/produtos_selecionados_store.dart';
import 'widgets/listtile_produtos_selecionados_widget.dart';

class ProdutosSelecionadosPage extends StatelessWidget {
  final ProdutosSelecionadosStore _produtosSelecionadosStore =
      GetIt.instance.get<ProdutosSelecionadosStore>();

  @override
  Widget build(BuildContext context) {
    return _conteudoParaExibir();
  }

  _conteudoParaExibir() {
    return Observer(builder: (_) {
      return _produtosSelecionadosStore.produtosSelecionados.length > 0
          ? ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: _produtosSelecionadosStore.produtosSelecionados.length,
              itemBuilder: (context, index) {
                return ListTileParaProdutosSelecionadosWidget(
                  produtoSelecionadoStore:
                      _produtosSelecionadosStore.produtosSelecionados[index],
                );
              })
          : Center(
              child: Text('Nenhum produto ainda foi selecionado.'),
            );
    });
  }
}
