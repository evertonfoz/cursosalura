import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx04/domain/models/produto_model.dart';
import 'package:numberpicker/numberpicker.dart';

class ListTileParaProdutosWidget extends StatelessWidget {
  final ProdutoModel produtoModel;
  final formatacaoMonetaria = NumberFormat.simpleCurrency();

  ListTileParaProdutosWidget({@required this.produtoModel});

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
              onTap: () async {
                int quantidade = await showDialog<int>(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return NumberPickerDialog.integer(
                      cancelWidget: Text('Cancelar'),
                      confirmWidget: Text('Confirmar'),
                      initialIntegerValue: 1,
                      minValue: 1,
                      maxValue: 10,
                      title: new Text("Quantidade para o item"),
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
