import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx04/domain/models/produto_pedido_model.dart';

class ListTileParaProdutosSelecionadosWidget extends StatelessWidget {
  final ProdutoPedidoModel produtoPedidoModel;
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

  ListTileParaProdutosSelecionadosWidget({
    @required this.produtoPedidoModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(produtoPedidoModel.produto.urlImagem),
      ),
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produtoPedidoModel.produto.nome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  produtoPedidoModel.produto.descricao,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                '${produtoPedidoModel.quantidade}',
                style: TextStyle(
                  color: Colors.indigo[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                '* ${formatacaoMonetaria.format(produtoPedidoModel.valor)}',
                style: TextStyle(
                  color: Colors.blue[300],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
      trailing: Container(
        width: 80,
        child: Row(
          children: [
            InkWell(
                child: Icon(
                  Icons.add,
                  size: 38,
                ),
                onTap: null),
            InkWell(
                child: Icon(
                  Icons.remove,
                  size: 38,
                ),
                onTap: null),
          ],
        ),
      ),
    );
  }
}
