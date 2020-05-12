import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx13/presentation/pages/produtos_selecionados/mobx/produto_selecionado_store.dart';
import 'package:mobx13/presentation/pages/produtos_selecionados/mobx/produtos_selecionados_store.dart';

import 'mixins/botoes_mixins_para_botoes_widgets_para_tile_selecionados.dart';

class BotoesWidgetParaTileSelecionados extends StatelessWidget
    with BotoesMixinParaBotoesWidgetsParaTileSelecionados {
  final ProdutosSelecionadosStore _produtosSelecionadosStore =
      GetIt.instance.get<ProdutosSelecionadosStore>();
  final ProdutoSelecionadoStore produtoSelecionadoStore;

  BotoesWidgetParaTileSelecionados({this.produtoSelecionadoStore});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Icon(
            Icons.add,
            size: 38,
          ),
          onTap: () => produtoSelecionadoStore.adicionarQuantidade(),
        ),
        InkWell(
          child: Icon(
            Icons.remove,
            size: 38,
          ),
          onTap: () {
            if (produtoSelecionadoStore.quantidade == 1)
              _produtosSelecionadosStore.retirarProduto(
                  produtoSelecionadoStore: produtoSelecionadoStore);
            else
              produtoSelecionadoStore.retirarQuantidade();
          },
        ),
        InkWell(
          child: Icon(
            Icons.delete,
            size: 38,
          ),
          onTap: () async {
            String oQueFazer = await showDialog(
              barrierDismissible: false,
              context: context,
              child: gerarDialog(
                  mensagem: produtoSelecionadoStore.produtoModel.nome),
            );
            if (oQueFazer == 'Não') return false;

            _produtosSelecionadosStore.retirarProduto(
                produtoSelecionadoStore: produtoSelecionadoStore);
            return true;
          },
        ),
      ],
    );
  }
}
