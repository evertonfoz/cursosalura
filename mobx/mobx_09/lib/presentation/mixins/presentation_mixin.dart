import 'package:flutter/material.dart';

mixin PresentationMixin {
  gerarText({
    String texto,
    bool negrito = false,
    double tamanhoFonte = 20,
    Color cor = Colors.black,
  }) {
    return Text(
      texto,
      style: TextStyle(
        fontWeight: negrito ? FontWeight.bold : FontWeight.normal,
        fontSize: tamanhoFonte,
        color: cor,
      ),
    );
  }
}
