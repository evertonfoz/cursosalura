import 'package:flutter/material.dart';

mixin PresentationMixin {
  gerarText({
    dynamic texto,
    bool negrito = false,
    double tamanhoFonte = 20,
    Color cor = Colors.black,
    TextAlign alinhamento = TextAlign.start,
  }) {
    return Text(
      '$texto',
      textAlign: alinhamento,
      style: TextStyle(
        fontWeight: negrito ? FontWeight.bold : FontWeight.normal,
        fontSize: tamanhoFonte,
        color: cor,
      ),
    );
  }
}
