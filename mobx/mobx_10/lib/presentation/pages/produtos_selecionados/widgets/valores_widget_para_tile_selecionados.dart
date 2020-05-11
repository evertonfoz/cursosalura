import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx10/presentation/mixins/presentation_mixin.dart';

class ValoresWidgetParaTileSelecionados extends StatelessWidget
    with PresentationMixin {
  final formatacaoMonetaria = NumberFormat.simpleCurrency();
  final int quantidade;
  final double valor;

  ValoresWidgetParaTileSelecionados({this.quantidade, this.valor});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        width: 40,
        child: gerarText(
          texto: quantidade,
          tamanhoFonte: 30,
          negrito: true,
          cor: Colors.indigo[900],
          alinhamento: TextAlign.end,
        ),
      ),
      Container(
        width: 20,
        child: gerarText(
          texto: ' x',
          negrito: true,
          cor: Colors.blue[300],
        ),
      ),
      Container(
        width: 70,
        child: gerarText(
          texto: formatacaoMonetaria.format(valor),
          negrito: true,
          cor: Colors.blue[300],
          alinhamento: TextAlign.end,
        ),
      ),
      Container(
        width: 20,
        child: gerarText(
          texto: ' =',
          negrito: true,
          cor: Colors.blue[300],
        ),
      ),
      Container(
        width: 120,
        child: gerarText(
          texto: formatacaoMonetaria.format(quantidade * valor),
          negrito: true,
          cor: Colors.indigo[900],
          alinhamento: TextAlign.end,
          tamanhoFonte: 30,
        ),
      ),
    ]);
  }
}
