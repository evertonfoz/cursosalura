import 'package:flutter/material.dart';
import 'package:mobx04video41/domain/models/produto_model.dart';

import '../../../data/datasources/produtos_datasource.dart' as datasource;
import 'mixins/lista_de_produtos_page_mixin.dart';
import 'mobx/lista_de_produtos_page_store.dart';
import 'widgets/listtile_para_lista_de_produtos_widget.dart';

// Declaração da classe ListaDeProdutosPage para fazer uso do mixin ListaDeProdutosPageMixin
class ListaDeProdutosPage extends StatelessWidget
    with ListaDeProdutosPageMixin {
  // Declaração do store para a lista de produtos na página ListaDeProdutosPage
  final ListaDeProdutosPageStore _listaDeProdutosPageStore =
      ListaDeProdutosPageStore();

  // Reescrita do método build da classe ListaDeProdutosPage
  @override
  Widget build(BuildContext context) {
    List<ProdutoModel> produtos = datasource.listaDeProdutos();
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ListTileParaListaDeProdutosWidget(
            produtoModel: produtos[index],
            // Envio de uma função anônima para o widget ListTileParaListaDeProdutosWidget
            funcaoDeCallbackParaInserirProduto: () async {
              int quantidade = await exibirSelecaoDeQuantidade(
                  context: context, item: produtos[index].nome);

              // Adaptação da confirmação de seleção de produto para invocar o método de registro
              if (quantidade != null)
                _listaDeProdutosPageStore.registrarProduto(
                    produto: produtos[index], quantidade: quantidade);
            },
          );
        });
  }
}
