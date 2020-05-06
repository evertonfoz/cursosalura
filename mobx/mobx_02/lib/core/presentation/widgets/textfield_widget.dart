import 'package:flutter/material.dart';

import 'mixins/textfield_widget_mixin.dart';

class TextFieldWidget extends StatelessWidget with TextFieldWidgetMixin {
  final IconData iconeParaPrefixo;
  final String textoDeAjuda;
  final String mensagemDeErro;
  final Function funcaoDeCallbackParaAlteracao;

  const TextFieldWidget({
    this.iconeParaPrefixo,
    this.textoDeAjuda,
    this.mensagemDeErro = '',
    this.funcaoDeCallbackParaAlteracao,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(iconeParaPrefixo)),
              TextField(
                onChanged: (value) {
                  funcaoDeCallbackParaAlteracao([value]);
                },
                decoration: InputDecoration(
                  hintText: textoDeAjuda,
                  contentPadding: const EdgeInsets.only(
                    left: 30.0,
                    right: 0,
                    top: 11,
                    bottom: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
        exibirMensagemDeErro(mensagem: mensagemDeErro),
      ],
    );
  }
}