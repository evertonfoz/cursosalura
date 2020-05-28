import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';

class ClippyWidget extends StatelessWidget {
  final double comprimentoCaixaDeMensagem = 200.0;
  final double alturaCaixaDeMensagem = 120.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Message(
          triangleX1: 0.4 * comprimentoCaixaDeMensagem,
          triangleX2: 0.5 * comprimentoCaixaDeMensagem,
          triangleX3: 0.5 * comprimentoCaixaDeMensagem,
          triangleY1: alturaCaixaDeMensagem * 0.2,
          clipShadows: [ClipShadow(color: Colors.black)],
          child: Container(
            color: Colors.pink,
            width: comprimentoCaixaDeMensagem,
            height: alturaCaixaDeMensagem,
            // Com a inserção do botão, precisamos ajustar o padding para a coluna
            child: Padding(
              padding: EdgeInsets.only(
                  top: alturaCaixaDeMensagem * 0.05,
                  bottom: alturaCaixaDeMensagem * 0.1,
                  left: 8,
                  right: 8),
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
                ],
              ),
            ),
          ),
        ),
        // Inserção de um espaço entre a mensagem e o mascote
        SizedBox(height: 8.0),
        // Inserção do mascote
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
