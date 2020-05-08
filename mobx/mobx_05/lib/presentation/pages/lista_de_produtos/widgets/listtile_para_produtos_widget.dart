import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx05/domain/models/produto_model.dart';
import 'package:mobx05/presentation/mixins/presentation_mixin.dart';

class ListTileParaProdutosWidget extends StatelessWidget
    with PresentationMixin {
  final ProdutoModel produtoModel;
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

  ListTileParaProdutosWidget({
    @required this.produtoModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(produtoModel.urlImagem),
      ),
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gerarText(texto: produtoModel.nome, negrito: true),
                gerarText(texto: produtoModel.descricao, tamanhoFonte: 15),
              ],
            ),
          ),
          gerarText(
              texto: formatacaoMonetaria.format(produtoModel.valor),
              negrito: true,
              cor: Colors.blue),
        ],
      ),
      trailing: Column(
        children: [
          InkWell(
              child: Icon(
                Icons.add,
                size: 48,
              ),
              onTap: () {}),
        ],
      ),
    );
  }
}
