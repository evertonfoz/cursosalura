import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx11/presentation/mixins/presentation_mixin.dart';
import 'package:mobx11/presentation/pages/produtos_selecionados/mobx/produto_selecionado_store.dart';
import 'package:mobx11/presentation/pages/produtos_selecionados/mobx/produtos_selecionados_store.dart';
import 'package:mobx11/presentation/pages/produtos_selecionados/widgets/mixins/botoes_mixins_para_botoes_widgets_para_tile_selecionados.dart';

class BotoesWidgetParaTileSelecionados extends StatelessWidget
    with PresentationMixin, BotoesMixinParaBotoesWidgetsParaTileSelecionados {
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
            _showSnackBar(
                context: context,
                texto:
                    'Incrementada a quantidade para ${produtoSelecionadoStore.produtoModel.nome.toUpperCase()}',
                cor: Colors.green[900]);
          },
        ),
        InkWell(
          child: Icon(
            Icons.remove,
            size: 38,
          ),
          onTap: () {
            String mensagemParaSnackBar;
            Color corParaSnackBar;
            if (produtoSelecionadoStore.quantidade == 1) {
              final ProdutosSelecionadosStore _produtosSelecionadosStore =
                  GetIt.instance.get<ProdutosSelecionadosStore>();
              _produtosSelecionadosStore.retirarProduto(
                  produtoSelecionadoStore: produtoSelecionadoStore);
              mensagemParaSnackBar =
                  'O produto ${produtoSelecionadoStore.produtoModel.nome.toUpperCase()} foi retirado da seleção';
              corParaSnackBar = Colors.red;
            } else {
              produtoSelecionadoStore.retirarQuantidade();
              mensagemParaSnackBar =
                  'Decrementada a quantidade para ${produtoSelecionadoStore.produtoModel.nome.toUpperCase()}';
              corParaSnackBar = Colors.yellowAccent;
            }
            _showSnackBar(
                context: context,
                texto: mensagemParaSnackBar,
                cor: corParaSnackBar,
                corParaTexto: Colors.blue[900]);
          },
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
              child: gerarDialog(
                  mensagem: produtoSelecionadoStore.produtoModel.nome),
            );
            if (oQueFazer == 'Não') return false;

            _showSnackBar(
                context: context,
                texto:
                    'O produto ${produtoSelecionadoStore.produtoModel.nome.toUpperCase()} foi retirado da seleção',
                cor: Colors.red);

            final ProdutosSelecionadosStore _produtosSelecionadosStore =
                GetIt.instance.get<ProdutosSelecionadosStore>();
            _produtosSelecionadosStore.retirarProduto(
                produtoSelecionadoStore: produtoSelecionadoStore);
            return true;
          },
        ),
      ],
    );
  }

  _showSnackBar(
      {BuildContext context,
      Color cor,
      String texto,
      Color corParaTexto = Colors.white}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: cor,
      content: gerarText(texto: texto, tamanhoFonte: 20, cor: corParaTexto),
      duration: Duration(seconds: 2),
    ));
  }
}
