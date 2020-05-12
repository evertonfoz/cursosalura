import 'package:flutter/material.dart';
import 'package:mobx12/presentation/mixins/presentation_mixin.dart';

class NomeDescricaoWidgetParaTileSelecionados extends StatelessWidget
    with PresentationMixin {
  final String nome;
  final String descricao;

  const NomeDescricaoWidgetParaTileSelecionados({this.nome, this.descricao});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gerarText(texto: nome, negrito: true),
            gerarText(texto: descricao, tamanhoFonte: 15),
          ],
        ),
      ),
    );
  }
}
