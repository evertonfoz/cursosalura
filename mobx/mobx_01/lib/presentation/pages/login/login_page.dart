import 'package:flutter/material.dart';
import 'package:mobx01/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx01/presentation/pages/login/mixins/login_page_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isFormSubmitted = false;

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
              textEditingController: emailController,
              prefixIcon: Icons.email,
              hintText: 'Informe o email',
              messageError: (_isFormSubmitted &&
                      !isAValidEmail(email: emailController.text))
                  ? 'O email é obrigatório'
                  : '',
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              textEditingController: passwordController,
              prefixIcon: Icons.security,
              hintText: 'Informe a senha',
              messageError: (_isFormSubmitted &&
                      !isAValidPassword(password: passwordController.text))
                  ? 'A senha é obritatória'
                  : '',
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('Acessar'),
                onPressed: _formSubmit), // _formSubmit),
          ],
        ),
      ),
    );
  }

  _formSubmit() {
    setState(() {
      if (!_isFormSubmitted) _isFormSubmitted = true;
    });
  }
}
