import 'package:dialog_information_to_specific_platform/dialog_information_to_specific_platform.dart';
import 'package:dialog_information_to_specific_platform/flat_buttons/actions_flatbutton_to_alert_dialog.dart';
import 'package:flutter/material.dart';

mixin BotoesMixinParaBotoesWidgetsParaTileSelecionados {
  gerarDialog({String mensagem}) {
    return InformationAlertDialog(
      iconTitle: Icon(
        Icons.message,
        color: Colors.red,
      ),
      title: 'Quer remover?',
      message: 'Confirma a retirada de ${mensagem.toUpperCase()}',
      buttons: [
        ActionsFlatButtonToAlertDialog(
          messageButton: 'Não',
          isEnabled: true,
        ),
        //   InformationAlertDialog.createFlatButton(),
        ActionsFlatButtonToAlertDialog(
          messageButton: 'Sim',
          isEnabled: true,
        ),
        //   InformationAlertDialog.createFlatButton(),
      ],
    );
  }
}
