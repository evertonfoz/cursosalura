import 'package:flutter/material.dart';

mixin TextFieldWidgetMixin {
  exibirMensagemDeErro({String mensagem, Color corParaErro = Colors.red}) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: mensagem.isNotEmpty,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.arrow_forward_ios,
            color: corParaErro,
            size: 12,
          ),
          Text(
            mensagem,
            style: TextStyle(
              color: corParaErro,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
