import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx02/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx02/presentation/pages/home/home_page.dart';

import 'mixins/login_page_mixin.dart';
import 'mobx/login_page_mobx.dart';

class LoginPage extends StatelessWidget with LoginPageMixin {
  final _loginPageMobx = LoginPageMobx();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Course - Alura'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                onChangedCallBack: _loginPageMobx.registerEmail,
                prefixIcon: Icons.email,
                hintText: 'Informe o email',
                messageError: !isAValidEmail(email: _loginPageMobx.email.value)
                    ? 'O email é obrigatório'
                    : '',
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                onChangedCallBack: _loginPageMobx.registerPassword,
                prefixIcon: Icons.security,
                hintText: 'Informe a senha',
                messageError:
                    !isAValidPassword(password: _loginPageMobx.password.value)
                        ? 'A senha é obritatória'
                        : '',
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text('Acessar'),
                  onPressed: isAValidForm(
                          email: _loginPageMobx.email.value,
                          password: _loginPageMobx.password.value)
                      ? () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      : null), // _formSubmit),
            ],
          );
        }),
      ),
    );
  }
}
