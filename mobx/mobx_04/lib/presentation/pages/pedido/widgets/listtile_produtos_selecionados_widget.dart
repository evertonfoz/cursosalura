import 'package:dialog_information_to_specific_platform/dialog_information_to_specific_platform.dart';
import 'package:dialog_information_to_specific_platform/flat_buttons/actions_flatbutton_to_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx04/presentation/pages/home/mobx/produto_pedido_store.dart';

class ListTileParaProdutosSelecionadosWidget extends StatelessWidget {
  final ProdutoPedidoStore produtoPedidoStore;
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

  ListTileParaProdutosSelecionadosWidget({
    @required this.produtoPedidoStore,
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
                    AssetImage(produtoPedidoStore.produtoModel.urlImagem),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produtoPedidoStore.produtoModel.nome,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        produtoPedidoStore.produtoModel.descricao,
//                  overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: 40,
                  child: Observer(builder: (_) {
                    return Text(
                      '${produtoPedidoStore.quantidade}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    );
                  })),
              Container(
                width: 15,
                child: Text(
                  ' x',
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 50,
                child: Text(
                  '${formatacaoMonetaria.format(produtoPedidoStore.produtoModel.valor)}',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: 15,
                child: Text(
                  ' =',
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  width: 120,
                  child: Observer(builder: (_) {
                    return Text(
                      '${formatacaoMonetaria.format(produtoPedidoStore.quantidade * produtoPedidoStore.produtoModel.valor)}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    );
                  })),
            ],
          ),
          Row(
            children: [
              InkWell(
                child: Icon(
                  Icons.add,
                  size: 38,
                ),
                onTap: () => produtoPedidoStore.adicionarQuantidade(),
              ),
              InkWell(
                child: Icon(
                  Icons.remove,
                  size: 38,
                ),
                onTap: () => produtoPedidoStore.retirarQuantidade(),
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
                    child: InformationAlertDialog(
                      iconTitle: Icon(
                        Icons.message,
                        color: Colors.red,
                      ),
                      title: 'Oops...Quer remover?',
                      message:
                          'Confirma a retirada de ${produtoPedidoStore.produtoModel.nome.toUpperCase()}',
                      buttons: [
                        ActionsFlatButtonToAlertDialog(
                          messageButton: 'Não',
                          isEnabled: true,
                        ),
                        //   InformationAlertDialog.createFlatButton(),
                        ActionsFlatButtonToAlertDialog(
                          messageButton: 'Sim',
                          isEnabled: true,
                        ),
                        //   InformationAlertDialog.createFlatButton(),
                      ],
                    ),
                  );
                  if (oQueFazer == 'Não') return false;

                  produtoPedidoStore.homePageStore.retirarProdutoDoPedido(produtoPedidoStore: produtoPedidoStore);
                  return true;
                },
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
