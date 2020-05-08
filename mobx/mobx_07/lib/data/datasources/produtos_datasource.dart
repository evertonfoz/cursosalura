import 'package:mobx07/domain/models/produto_model.dart';

List<ProdutoModel> _listaDeProdutos = [
  ProdutoModel(
      produtoId: 1,
      nome: 'Suco de Laranja',
      descricao: 'Suco natural',
      valor: 4,
      urlImagem: 'assets/images/produtos/sucodelaranja.jpg'),
  ProdutoModel(
      produtoId: 2,
      nome: 'Suco de Uva',
      descricao: 'Poupa da fruta',
      valor: 4,
      urlImagem: 'assets/images/produtos/sucodeuva.jpg'),
  ProdutoModel(
      produtoId: 3,
      nome: 'Frango a passarinho',
      descricao: 'Porção de 800g de frango',
      valor: 15,
      urlImagem: 'assets/images/produtos/frangoapassarinho.jpg'),
  ProdutoModel(
      produtoId: 4,
      nome: 'Tábua de frios',
      descricao: '800g distribuídos em queijo, salame e azeitona',
      valor: 20,
      urlImagem: 'assets/images/produtos/tabuadefrios.jpeg'),
  ProdutoModel(
      produtoId: 5,
      nome: 'Cheese Burger',
      descricao: 'Sanduíche com pão de hamburger, hamburguer de 100g e queijo',
      valor: 10,
      urlImagem: 'assets/images/produtos/cheeseburguer.jpg'),
];

List<ProdutoModel> listaDeProdutos() {
  _listaDeProdutos
      .sort((a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
  List<ProdutoModel> _unmodifiabileList = List.unmodifiable(_listaDeProdutos);
  return _unmodifiabileList;
}
