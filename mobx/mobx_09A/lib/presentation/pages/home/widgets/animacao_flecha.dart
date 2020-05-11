import 'package:flutter/material.dart';

import 'flecha_widget.dart';

class AnimacaoFlecha extends AnimatedWidget {
  AnimacaoFlecha({Animation<double> animacao}) : super(listenable: animacao);

  Widget build(BuildContext context) {
    final animacao = listenable as Animation<double>;
    return FechaWidget(
      esquerda: animacao.value,
    );
  }
}
