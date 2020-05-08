import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';

class ClippyWidget extends StatelessWidget {
  final double messageBoxWidth = 200.0;
  final double messageBoxHeight = 120.0;
  final Function funcaoParaRegistrarLeituraOrientacao;

  ClippyWidget({this.funcaoParaRegistrarLeituraOrientacao});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Message(
          triangleX1: 0.4 * messageBoxWidth,
          triangleX2: 0.5 * messageBoxWidth,
          triangleX3: 0.5 * messageBoxWidth,
          triangleY1: messageBoxHeight * 0.2,
          clipShadows: [ClipShadow(color: Colors.black)],
          child: Container(
            color: Colors.pink,
            width: messageBoxWidth,
            height: messageBoxHeight,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: messageBoxHeight * 0.2, left: 8, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Veja sempre o total do pedido, no topo direito da tela.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                      onPressed: funcaoParaRegistrarLeituraOrientacao,
                      child: Text(
                        "Ok. Entendi!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          width: 200.0,
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/home/clippy.png',
              width: 150.0,
            ),
          ),
        ),
      ],
    );
  }
}
