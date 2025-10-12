class CartaoModel {
  final int id;
  final String name;
  final int digitos;
  final double limitValue;
  final int day;
  final int userId;

  CartaoModel({
    required this.id,
    required this.name,
    required this.digitos,
    required this.limitValue,
    required this.day,
    required this.userId,
  });

  factory CartaoModel.fromMap(Map<String, dynamic> map) {
    return CartaoModel(
      id: map['id'] as int,
      name: map['name'] as String,
      digitos: map['digitos'] as int,
      limitValue: (map['limit_value'] as num).toDouble(),
      day: map['day'] as int,
      userId: map['user_id'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'digitos': digitos,
      'limit_value': limitValue,
      'day': day,
      'user_id': userId,
    };
  }
}
