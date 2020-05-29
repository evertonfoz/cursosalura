import 'package:flutter/material.dart';

import 'flecha_widget.dart';

class AnimacaoFlechaWidget extends AnimatedWidget {
  AnimacaoFlechaWidget({Animation<double> animacao})
      : super(listenable: animacao);

  Widget build(BuildContext context) {
    final animacao = listenable as Animation<double>;
    return FlechaWidget(
      esquerda: animacao.value,
    );
  }
}
