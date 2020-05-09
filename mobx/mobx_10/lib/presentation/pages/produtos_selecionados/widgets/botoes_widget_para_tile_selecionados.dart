import 'package:flutter/material.dart';
import 'package:mobx10/presentation/mixins/presentation_mixin.dart';
import 'package:mobx10/presentation/pages/produtos_selecionados/mobx/produto_selecionado_store.dart';

class BotoesWidgetParaTileSelecionados extends StatelessWidget
    with PresentationMixin {
  final ProdutoSelecionadoStore produtoSelecionadoStore;

  const BotoesWidgetParaTileSelecionados({this.produtoSelecionadoStore});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Icon(
            Icons.add,
            size: 38,
          ),
          onTap: () {
            produtoSelecionadoStore.adicionarQuantidade();
            Scaffold.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green[900],
              content: gerarText(
                  texto:
                      'Incrementada a quantidade para ${produtoSelecionadoStore.produtoModel.nome.toUpperCase()}',
                  tamanhoFonte: 20,
                  cor: Colors.white),
            ));
          },
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
    );
  }
}
