import 'package:flutter/material.dart';
import 'package:mobx03video32/domain/models/produto_model.dart';

import '../../../data/datasources/produtos_datasource.dart' as datasource;
import 'widgets/listtile_para_lista_de_produtos_widget.dart';

class ListaDeProdutosPage extends StatelessWidget {
  // Reescrita do método build da classe ListaDeProdutosPage
  @override
  Widget build(BuildContext context) {
    List<ProdutoModel> produtos = datasource.listaDeProdutos();
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ListTileParaListaDeProdutosWidget(
              produtoModel: produtos[index]);
        });
  }
}
