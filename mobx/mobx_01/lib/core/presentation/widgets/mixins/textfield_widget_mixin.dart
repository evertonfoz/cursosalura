import 'package:flutter/material.dart';

mixin TextFieldWidgetMixin {
  errorMessage({String messageError, Color errorColor = Colors.red}) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: messageError.isNotEmpty,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.arrow_forward_ios,
            color: errorColor,
            size: 12,
          ),
          Text(
            messageError,
            style: TextStyle(
              color: errorColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
