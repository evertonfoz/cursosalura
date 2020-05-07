import 'package:flutter/material.dart';

import 'mixins/textfield_widget_mixin.dart';

class TextFieldWidget extends StatelessWidget with TextFieldWidgetMixin {
  final IconData iconeParaPrefixo;
  final String textoDeAjuda;
  final String mensagemDeErro;
  final FocusNode focusNode;
  final Function funcaoDeCallbackParaAlteracao;
  final Function funcaoDeCallbackParaSubmissaoDoText;
  final TextInputAction textInputAction;

  const TextFieldWidget({
    this.iconeParaPrefixo,
    this.textoDeAjuda,
    this.mensagemDeErro = '',
    this.funcaoDeCallbackParaAlteracao,
    this.funcaoDeCallbackParaSubmissaoDoText,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
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
                textInputAction: textInputAction,
                onChanged: (value) {
                  funcaoDeCallbackParaAlteracao(value);
                },
                onSubmitted: (_) => funcaoDeCallbackParaSubmissaoDoText(),
                focusNode: focusNode,
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
