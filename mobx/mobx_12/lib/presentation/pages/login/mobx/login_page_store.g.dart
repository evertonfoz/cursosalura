// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginPageStore on _LoginPageStore, Store {
  Computed<bool> _$oEmailEhValidoComputed;

  @override
  bool get oEmailEhValido =>
      (_$oEmailEhValidoComputed ??= Computed<bool>(() => super.oEmailEhValido))
          .value;
  Computed<bool> _$aSenhaEhValidaComputed;

  @override
  bool get aSenhaEhValida =>
      (_$aSenhaEhValidaComputed ??= Computed<bool>(() => super.aSenhaEhValida))
          .value;
  Computed<bool> _$oFormularioEhValidoComputed;

  @override
  bool get oFormularioEhValido => (_$oFormularioEhValidoComputed ??=
          Computed<bool>(() => super.oFormularioEhValido))
      .value;

  final _$emailAtom = Atom(name: '_LoginPageStore.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_LoginPageStore.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$_LoginPageStoreActionController =
      ActionController(name: '_LoginPageStore');

  @override
  dynamic atualizarEmail({String newValue}) {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction();
    try {
      return super.atualizarEmail(newValue: newValue);
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizarSenha({String newValue}) {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction();
    try {
      return super.atualizarSenha(newValue: newValue);
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},senha: ${senha.toString()},oEmailEhValido: ${oEmailEhValido.toString()},aSenhaEhValida: ${aSenhaEhValida.toString()},oFormularioEhValido: ${oFormularioEhValido.toString()}';
    return '{$string}';
  }
}
