import 'package:flutter/material.dart';

class RaisedButtonWithSnackBarWidget extends StatelessWidget {
  final bool onPressedVisible;
  final String buttonText;
  final String successTextToSnackBar;
  final Function onButtonPressed;
  final Function onSnackBarClosed;
  final String failtTextToSnackbar;

  RaisedButtonWithSnackBarWidget({
    @required this.onPressedVisible,
    @required this.buttonText,
    @required this.successTextToSnackBar,
    @required this.failtTextToSnackbar,
    @required this.onButtonPressed,
    @required this.onSnackBarClosed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.buttonText),
      onPressed: this.onPressedVisible
          ? () => _onPressedRaisedButton
          : null,
    );
  }

  _onPressedRaisedButton(BuildContext buildContext) async {
    String textToSnackBar = this.successTextToSnackBar;
    bool success = true;
    FocusScope.of(buildContext).unfocus();
    try {
      await this.onButtonPressed();
    } catch (e) {
      textToSnackBar = this.failtTextToSnackbar + ': ' + e.toString();
      success = false;
    }

    Scaffold.of(buildContext)
        .showSnackBar(
          SnackBar(
            backgroundColor: (success) ? Colors.indigo : Colors.red,
            content: Text(
              textToSnackBar,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (success) ? 14 : 16,
              ),
            ),
            duration: Duration(seconds: (success) ? 3 : 5),
          ),
        )
        .closed
        .then((_) => (success) ? this.onSnackBarClosed() : () {});
  }
}
