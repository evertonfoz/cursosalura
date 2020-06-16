import 'package:flutter/material.dart';

mixin TextFormFieldMixin {
  textFormField({
    maxLines,
    focusNode,
    controller,
    labelText,
    textInputAction,
    onFieldSubmitted,
    validator,
  }){
    return TextFormField(
      autovalidate: true,
      maxLines: maxLines ?? 1,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText ?? 'Informe o labelText',
      ),
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
    );
  }
}