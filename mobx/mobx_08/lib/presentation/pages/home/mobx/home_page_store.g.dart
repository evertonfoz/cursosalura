// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageStore on _HomePageStore, Store {
  Computed<String> _$tituloHomePageComputed;

  @override
  String get tituloHomePage => (_$tituloHomePageComputed ??=
          Computed<String>(() => super.tituloHomePage))
      .value;
  Computed<double> _$totalPedidoComputed;

  @override
  double get totalPedido =>
      (_$totalPedidoComputed ??= Computed<double>(() => super.totalPedido))
          .value;

  final _$paginaAtualAtom = Atom(name: '_HomePageStore.paginaAtual');

  @override
  int get paginaAtual {
    _$paginaAtualAtom.context.enforceReadPolicy(_$paginaAtualAtom);
    _$paginaAtualAtom.reportObserved();
    return super.paginaAtual;
  }

  @override
  set paginaAtual(int value) {
    _$paginaAtualAtom.context.conditionallyRunInAction(() {
      super.paginaAtual = value;
      _$paginaAtualAtom.reportChanged();
    }, _$paginaAtualAtom, name: '${_$paginaAtualAtom.name}_set');
  }

  final _$_totalPedidoAtom = Atom(name: '_HomePageStore._totalPedido');

  @override
  double get _totalPedido {
    _$_totalPedidoAtom.context.enforceReadPolicy(_$_totalPedidoAtom);
    _$_totalPedidoAtom.reportObserved();
    return super._totalPedido;
  }

  @override
  set _totalPedido(double value) {
    _$_totalPedidoAtom.context.conditionallyRunInAction(() {
      super._totalPedido = value;
      _$_totalPedidoAtom.reportChanged();
    }, _$_totalPedidoAtom, name: '${_$_totalPedidoAtom.name}_set');
  }

  final _$orientacaoJaLidaAtom = Atom(name: '_HomePageStore.orientacaoJaLida');

  @override
  bool get orientacaoJaLida {
    _$orientacaoJaLidaAtom.context.enforceReadPolicy(_$orientacaoJaLidaAtom);
    _$orientacaoJaLidaAtom.reportObserved();
    return super.orientacaoJaLida;
  }

  @override
  set orientacaoJaLida(bool value) {
    _$orientacaoJaLidaAtom.context.conditionallyRunInAction(() {
      super.orientacaoJaLida = value;
      _$orientacaoJaLidaAtom.reportChanged();
    }, _$orientacaoJaLidaAtom, name: '${_$orientacaoJaLidaAtom.name}_set');
  }

  final _$operacaoRealizadaAtom =
      Atom(name: '_HomePageStore.operacaoRealizada');

  @override
  String get operacaoRealizada {
    _$operacaoRealizadaAtom.context.enforceReadPolicy(_$operacaoRealizadaAtom);
    _$operacaoRealizadaAtom.reportObserved();
    return super.operacaoRealizada;
  }

  @override
  set operacaoRealizada(String value) {
    _$operacaoRealizadaAtom.context.conditionallyRunInAction(() {
      super.operacaoRealizada = value;
      _$operacaoRealizadaAtom.reportChanged();
    }, _$operacaoRealizadaAtom, name: '${_$operacaoRealizadaAtom.name}_set');
  }

  final _$exibirBottonNavigationBarAtom =
      Atom(name: '_HomePageStore.exibirBottonNavigationBar');

  @override
  bool get exibirBottonNavigationBar {
    _$exibirBottonNavigationBarAtom.context
        .enforceReadPolicy(_$exibirBottonNavigationBarAtom);
    _$exibirBottonNavigationBarAtom.reportObserved();
    return super.exibirBottonNavigationBar;
  }

  @override
  set exibirBottonNavigationBar(bool value) {
    _$exibirBottonNavigationBarAtom.context.conditionallyRunInAction(() {
      super.exibirBottonNavigationBar = value;
      _$exibirBottonNavigationBarAtom.reportChanged();
    }, _$exibirBottonNavigationBarAtom,
        name: '${_$exibirBottonNavigationBarAtom.name}_set');
  }

  final _$_HomePageStoreActionController =
      ActionController(name: '_HomePageStore');

  @override
  dynamic alternarPagina({int novaPagina}) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction();
    try {
      return super.alternarPagina(novaPagina: novaPagina);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic somarAoTotalDoPedido({double valor, String operacaoRealizada}) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction();
    try {
      return super.somarAoTotalDoPedido(
          valor: valor, operacaoRealizada: operacaoRealizada);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic registrarLeituraOrientacao() {
    final _$actionInfo = _$_HomePageStoreActionController.startAction();
    try {
      return super.registrarLeituraOrientacao();
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toogleExibirBottonNavigationBar() {
    final _$actionInfo = _$_HomePageStoreActionController.startAction();
    try {
      return super.toogleExibirBottonNavigationBar();
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'paginaAtual: ${paginaAtual.toString()},orientacaoJaLida: ${orientacaoJaLida.toString()},operacaoRealizada: ${operacaoRealizada.toString()},exibirBottonNavigationBar: ${exibirBottonNavigationBar.toString()},tituloHomePage: ${tituloHomePage.toString()},totalPedido: ${totalPedido.toString()}';
    return '{$string}';
  }
}
