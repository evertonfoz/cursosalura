import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx05/data/datasources/produtos_datasource.dart' as datasource;
import 'package:mobx05/domain/models/produto_model.dart';
import 'package:mobx05/presentation/pages/home/mobx/home_page_store.dart';

import 'widgets/listtile_para_lista_de_produtos_widget.dart';

class ListaDeProdutosPage extends StatelessWidget {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

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
