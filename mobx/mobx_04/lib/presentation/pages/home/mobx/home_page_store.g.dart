// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageStore on _HomePageStore, Store {
  Computed<String> _$totalPedidoComputed;

  @override
  String get totalPedido =>
      (_$totalPedidoComputed ??= Computed<String>(() => super.totalPedido))
          .value;
  Computed<String> _$tituloHomePageComputed;

  @override
  String get tituloHomePage => (_$tituloHomePageComputed ??=
          Computed<String>(() => super.tituloHomePage))
      .value;

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

  final _$produtosSelecionadosAtom =
      Atom(name: '_HomePageStore.produtosSelecionados');

  @override
  ObservableList<ProdutoModel> get produtosSelecionados {
    _$produtosSelecionadosAtom.context
        .enforceReadPolicy(_$produtosSelecionadosAtom);
    _$produtosSelecionadosAtom.reportObserved();
    return super.produtosSelecionados;
  }

  @override
  set produtosSelecionados(ObservableList<ProdutoModel> value) {
    _$produtosSelecionadosAtom.context.conditionallyRunInAction(() {
      super.produtosSelecionados = value;
      _$produtosSelecionadosAtom.reportChanged();
    }, _$produtosSelecionadosAtom,
        name: '${_$produtosSelecionadosAtom.name}_set');
  }

  final _$_HomePageStoreActionController =
      ActionController(name: '_HomePageStore');

  @override
  dynamic registrarProduto({double valorProduto}) {
    final _$actionInfo = _$_HomePageStoreActionController.startAction();
    try {
      return super.registrarProduto(valorProduto: valorProduto);
    } finally {
      _$_HomePageStoreActionController.endAction(_$actionInfo);
    }
  }

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
  String toString() {
    final string =
        'paginaAtual: ${paginaAtual.toString()},produtosSelecionados: ${produtosSelecionados.toString()},totalPedido: ${totalPedido.toString()},tituloHomePage: ${tituloHomePage.toString()}';
    return '{$string}';
  }
}
