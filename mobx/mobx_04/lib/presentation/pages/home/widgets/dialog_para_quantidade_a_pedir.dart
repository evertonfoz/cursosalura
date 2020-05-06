import 'package:flutter/material.dart';

class DialogParaQuantidadeAPedir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Teste'),
    );
//    return showDialog<int>(
//          context: context,
//          builder: (BuildContext context) {
//            return NumberPickerDialog.integer(
//              minValue: 1,
//              maxValue: 10,
//              title: new Text("Pick a new price"),
//            );
//          }).then((value) => null);
  }
}
