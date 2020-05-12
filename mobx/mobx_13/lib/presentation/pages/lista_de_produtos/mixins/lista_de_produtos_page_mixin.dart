import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

mixin ListaDeProdutosPageMixin {
  Future<int> exibirSelecaoDeQuantidade(
      {BuildContext context, String item}) async {
    return await showDialog<int>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return NumberPickerDialog.integer(
          cancelWidget: Text('Cancelar'),
          confirmWidget: Text('Confirmar'),
          initialIntegerValue: 1,
          minValue: 1,
          maxValue: 10,
          title: new Text(
            "Quantidade para \n${item.toUpperCase()}",
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
