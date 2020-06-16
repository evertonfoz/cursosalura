import 'package:flutter/material.dart';
import 'package:testevideoaula12/presentation/pages/login_page.dart';

/// Adatapção do método main() para a classe AluraDeliveryAppp
void main() {
  runApp(AluraDeliveryApp());
}

class AluraDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alura Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.primary,
        ),
      ),

      /// Adaptação do home de Scaffold para renderizar o LoginPage
      home: LoginPage(),
    );
  }
}
