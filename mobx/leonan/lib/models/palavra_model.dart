import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'palavra_model.g.dart';

@JsonSerializable()
class PalavraModel {
  String palavraID;
  final String palavra;
  final String ajuda;

  PalavraModel({this.palavraID, this.palavra, this.ajuda});

  @override
  List<Object> get props => [palavraID];

  factory PalavraModel.fromJson(Map<String, dynamic> json) => _$PalavraModelFromJson(json);
  Map<String, dynamic> toJson() => _$PalavraModelToJson(this);
  
}