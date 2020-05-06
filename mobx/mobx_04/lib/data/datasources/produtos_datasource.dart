import 'package:mobx04/domain/models/produto_model.dart';

List<ProdutoModel> listaDeProdutos = [
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
