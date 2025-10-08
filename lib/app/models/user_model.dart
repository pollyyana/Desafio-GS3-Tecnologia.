import 'cartao_model.dart';

class UserModel {
  final int id;
  final String name;
  final String cpf;
  final String password;
  final List<CartaoModel>? cartoes;

  UserModel({
    required this.id,
    required this.name,
    required this.cpf,
    required this.password,
    this.cartoes,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    cpf: json['cpf'],
    password: json['password'],
    cartoes: json['cartoes'] != null
        ? (json['cartoes'] as List).map((e) => CartaoModel.fromJson(e)).toList()
        : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'cpf': cpf,
    'password': password,
    'cartoes': cartoes?.map((e) => e.toJson()).toList(),
  };
}
