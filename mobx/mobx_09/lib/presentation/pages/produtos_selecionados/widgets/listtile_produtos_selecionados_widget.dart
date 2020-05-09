import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx09/domain/models/produto_pedido_model.dart';
import 'package:mobx09/presentation/mixins/presentation_mixin.dart';

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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gerarText(
                          texto: produtoPedidoModel.produtoModel.nome,
                          negrito: true),
                      gerarText(
                          texto: produtoPedidoModel.produtoModel.descricao,
                          tamanhoFonte: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              width: 40,
              child: gerarText(
                texto: produtoPedidoModel.quantidade,
                tamanhoFonte: 30,
                negrito: true,
                cor: Colors.indigo[900],
                alinhamento: TextAlign.end,
              ),
            ),
            Container(
              width: 20,
              child: gerarText(
                texto: ' x',
                negrito: true,
                cor: Colors.blue[300],
              ),
            ),
            Container(
              width: 70,
              child: gerarText(
                texto: formatacaoMonetaria
                    .format(produtoPedidoModel.produtoModel.valor),
                negrito: true,
                cor: Colors.blue[300],
                alinhamento: TextAlign.end,
              ),
            ),
            Container(
              width: 20,
              child: gerarText(
                texto: ' =',
                negrito: true,
                cor: Colors.blue[300],
              ),
            ),
            Container(
              width: 120,
              child: gerarText(
                texto: formatacaoMonetaria.format(
                    produtoPedidoModel.quantidade *
                        produtoPedidoModel.produtoModel.valor),
                negrito: true,
                cor: Colors.indigo[900],
                alinhamento: TextAlign.end,
                tamanhoFonte: 30,
              ),
            ),
          ]),
          Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.add,
                  size: 38,
                ),
                onTap: () => {},
              ),
              InkWell(
                child: Icon(
                  Icons.remove,
                  size: 38,
                ),
                onTap: () => {},
              ),
              InkWell(
                child: Icon(
                  Icons.delete,
                  size: 38,
                ),
                onTap: () {},
              ),
            ],
          ),
          Divider(
            height: 5,
          )
        ],
      ),
    );
  }
}
