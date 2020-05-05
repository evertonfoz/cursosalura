import 'package:flutter/material.dart';

import 'mixins/textfield_widget_mixin.dart';

class TextFieldWidget extends StatefulWidget {
  final IconData prefixIcon;
  final String hintText;
  final String messageError;
  final TextEditingController textEditingController;

  const TextFieldWidget({
    this.prefixIcon,
    this.hintText,
    this.messageError = '',
    this.textEditingController,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>
    with TextFieldWidgetMixin {
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
                  child: Icon(widget.prefixIcon)),
              TextField(
                controller: widget.textEditingController,
                decoration: InputDecoration(
                  hintText: widget.hintText,
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
        errorMessage(messageError: widget.messageError),
      ],
    );
  }
}
