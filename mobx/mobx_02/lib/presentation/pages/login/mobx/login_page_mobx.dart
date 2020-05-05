import 'package:mobx/mobx.dart';

class LoginPageMobx {
  Observable<String> email = Observable('');
  Observable<String> password = Observable('');

  Action registerEmail;
  Action registerPassword;

  LoginPageMobx() {
    registerEmail = Action(_registerEmail);
    registerPassword = Action(_registerPassword);
  }

  _registerEmail(String newValue) {
    email.value = newValue;
  }

  _registerPassword(String newValue) {
    password.value = newValue;
  }
}
