import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx10/presentation/mixins/presentation_mixin.dart';
import 'package:mobx10/presentation/pages/produtos_selecionados/mobx/produto_selecionado_store.dart';

import 'botoes_widget_para_tile_selecionados.dart';
import 'nome_descricao_widget_para_tile_selecionados.dart';
import 'valores_widget_para_tile_selecionados.dart';

class ListTileParaProdutosSelecionadosWidget extends StatelessWidget
    with PresentationMixin {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();
  final ProdutoSelecionadoStore produtoSelecionadoStore;

  ListTileParaProdutosSelecionadosWidget({
    @required this.produtoSelecionadoStore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage:
                    AssetImage(produtoSelecionadoStore.produtoModel.urlImagem),
              ),
              NomeDescricaoWidgetParaTileSelecionados(
                nome: produtoSelecionadoStore.produtoModel.nome,
                descricao: produtoSelecionadoStore.produtoModel.descricao,
              ),
            ],
          ),
          Observer(builder: (_) {
            return ValoresWidgetParaTileSelecionados(
              quantidade: produtoSelecionadoStore.quantidade,
              valor: produtoSelecionadoStore.produtoModel.valor,
            );
          }),
          BotoesWidgetParaTileSelecionados(
            produtoSelecionadoStore: produtoSelecionadoStore,
          ),
          Divider(
            height: 5,
          )
        ],
      ),
    );
  }
}
