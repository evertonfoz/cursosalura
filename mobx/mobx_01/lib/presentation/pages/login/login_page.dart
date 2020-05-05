import 'package:flutter/material.dart';
import 'package:mobx01/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx01/presentation/pages/home/home_page.dart';
import 'package:mobx01/presentation/pages/login/mixins/login_page_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  String _email = '';
  String _password = '';

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
              onChangedCallBack: (newValue) {
                setState(() {
                  _email = newValue;
                });
              },
              prefixIcon: Icons.email,
              hintText: 'Informe o email',
              messageError:
                  !isAValidEmail(email: _email) ? 'O email é obrigatório' : '',
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              onChangedCallBack: (newValue) {
                setState(() {
                  _password = newValue;
                });
              },
              prefixIcon: Icons.security,
              hintText: 'Informe a senha',
              messageError: !isAValidPassword(password: _password)
                  ? 'A senha é obritatória'
                  : '',
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('Acessar'),
                onPressed: (isAValidForm(email: _email, password: _password))
                    ? _formSubmit
                    : null), // _formSubmit),
          ],
        ),
      ),
    );
  }

  _formSubmit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
