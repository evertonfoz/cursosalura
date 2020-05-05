import 'package:flutter/material.dart';

import 'mixins/textfield_widget_mixin.dart';

class TextFieldWidget extends StatelessWidget with TextFieldWidgetMixin {
  final IconData prefixIcon;
  final String hintText;
  final String messageError;
  final Function onChangedCallBack;

  const TextFieldWidget({
    this.prefixIcon,
    this.hintText,
    this.messageError = '',
    this.onChangedCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Stack(
            children: [
              Align(alignment: Alignment.centerLeft, child: Icon(prefixIcon)),
              TextField(
                onChanged: (value) {
                  onChangedCallBack([value]);
                },
                decoration: InputDecoration(
                  hintText: hintText,
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
        errorMessage(messageError: messageError),
      ],
    );
  }
}
