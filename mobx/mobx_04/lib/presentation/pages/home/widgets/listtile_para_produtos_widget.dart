import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx04/domain/models/produto_model.dart';

class ListTileParaProdutosWidget extends StatelessWidget {
  final ProdutoModel produtoModel;
  final Function funcaoDeCallbackParaInserirProduto;
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

  ListTileParaProdutosWidget({
    @required this.produtoModel,
    this.funcaoDeCallbackParaInserirProduto,
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
                Text(
                  produtoModel.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  produtoModel.descricao,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatacaoMonetaria.format(produtoModel.valor),
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      trailing: Column(
        children: [
          InkWell(
              child: Icon(
                Icons.add,
                size: 48,
              ),
              onTap: funcaoDeCallbackParaInserirProduto),
        ],
      ),
    );
  }
}
