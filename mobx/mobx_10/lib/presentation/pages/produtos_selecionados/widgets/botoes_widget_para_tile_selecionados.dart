import 'package:flutter/material.dart';

class BotoesWidgetParaTileSelecionados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Icon(
            Icons.add,
            size: 38,
          ),
          onTap: () => {},
        ),
        InkWell(
          child: Icon(
            Icons.remove,
            size: 38,
          ),
          onTap: () => {},
        ),
        InkWell(
          child: Icon(
            Icons.delete,
            size: 38,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
