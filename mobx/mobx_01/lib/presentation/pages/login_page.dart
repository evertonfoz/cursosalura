import 'package:flutter/material.dart';
import 'package:mobx01/core/presentation/widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Course - Alura'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              prefixIcon: Icons.email,
              hintText: 'Informe o email',
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              prefixIcon: Icons.security,
              hintText: 'Informe a senha',
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Acessar'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
