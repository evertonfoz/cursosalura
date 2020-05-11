import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx09/domain/models/produto_pedido_model.dart';
import 'package:mobx09/presentation/mixins/presentation_mixin.dart';

import 'botoes_widget_para_tile_selecionados.dart';
import 'nome_descricao_widget_para_tile_selecionados.dart';
import 'valores_widget_para_tile_selecionados.dart';

class ListTileParaProdutosSelecionadosWidget extends StatelessWidget
    with PresentationMixin {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();
  final ProdutoPedidoModel produtoPedidoModel;

  ListTileParaProdutosSelecionadosWidget({
    @required this.produtoPedidoModel,
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
                    AssetImage(produtoPedidoModel.produtoModel.urlImagem),
              ),
              NomeDescricaoWidgetParaTileSelecionados(
                nome: produtoPedidoModel.produtoModel.nome,
                descricao: produtoPedidoModel.produtoModel.descricao,
              ),
            ],
          ),
          ValoresWidgetParaTileSelecionados(
            quantidade: produtoPedidoModel.quantidade,
            valor: produtoPedidoModel.produtoModel.valor,
          ),
          BotoesWidgetParaTileSelecionados(),
          Divider(
            height: 5,
          )
        ],
      ),
    );
  }
}
