import 'package:mobx/mobx.dart';

part 'login_page_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class LoginPageStore = _LoginPageStore with _$LoginPageStore;

abstract class _LoginPageStore with Store {
  @observable
  String email = '';

  @observable
  String senha = '';

  @observable
  bool emProcessamento = false;

  @computed
  bool get oEmailEhValido => email.trim().length > 0;

  @computed
  bool get aSenhaEhValida => senha.trim().length > 0;

  @computed
  bool get oFormularioEhValido => (oEmailEhValido && aSenhaEhValida);

  @action
  atualizarEmail({String newValue}) {
    email = newValue;
  }

  @action
  atualizarSenha({String newValue}) {
    senha = newValue;
  }

  @action
  atualizarEmProcessamento({bool newValue}) {
    emProcessamento = newValue;
  }
}
