class UserModel {
  final int? id;
  final String name;
  final String cpf;
  final String password;

  UserModel({
    this.id,
    required this.name,
    required this.cpf,
    required this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      cpf: map['cpf'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'password': password,
    };
  }
}
