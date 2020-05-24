import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx03video32/domain/models/produto_model.dart';
import 'package:mobx03video32/presentation/mixins/presentation_mixin.dart';

class ListTileParaListaDeProdutosWidget extends StatelessWidget
    with PresentationMixin {
  // Declaração implementada no início da classe ListTileParaListaDeProdutosWidget
  final formatacaoMonetaria = NumberFormat.simpleCurrency(locale: 'pt_BR');
  final ProdutoModel produtoModel;

  ListTileParaListaDeProdutosWidget({
    @required this.produtoModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Imagem para cada produto
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(produtoModel.urlImagem),
      ),
      // Linha com dados sobre o produto
      title: Row(
        children: [
          // Renderização do nome e descrição para o produto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gerarText(texto: produtoModel.nome, negrito: true),
                gerarText(texto: produtoModel.descricao, tamanhoFonte: 15),
              ],
            ),
          ),
          // Valor para o produto
          gerarText(
              // Adaptação da propriedade texto na invocação a gerarText para o valor do produto
              texto: formatacaoMonetaria.format(produtoModel.valor),
              negrito: true,
              cor: Colors.blue),
        ],
      ),
      // Botão que possibilitará o registro do produto no pedido do usuário
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
