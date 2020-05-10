import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx06/data/datasources/produtos_datasource.dart' as datasource;
import 'package:mobx06/domain/models/produto_model.dart';
import 'package:mobx06/presentation/pages/lista_de_produtos/mixins/lista_de_produtos_page_mixin.dart';
import 'package:mobx06/presentation/pages/lista_de_produtos/mobx/lista_de_produtos_page_store.dart';

import 'widgets/listtile_para_lista_de_produtos_widget.dart';

class ListaDeProdutosPage extends StatelessWidget
    with ListaDeProdutosPageMixin {
  final ListaDeProdutosPageStore _listaDeProdutosPageStore =
      GetIt.instance.get<ListaDeProdutosPageStore>();

  @override
  Widget build(BuildContext context) {
    List<ProdutoModel> produtos = datasource.listaDeProdutos();
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ListTileParaListaDeProdutosWidget(
            produtoModel: produtos[index],
            funcaoDeCallbackParaInserirProduto: () async {
              int quantidade = await exibirSelecaoDeQuantidade(
                  context: context, item: produtos[index].nome);
              if (quantidade != null)
                _listaDeProdutosPageStore.registrarProduto(
                    produto: produtos[index], quantidade: quantidade);
            },
          );
        });
  }
}
