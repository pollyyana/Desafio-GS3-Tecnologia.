class CartaoModel {
  final int? id;
  final String name;
  final int digitos;
  final double limitValue;
  final int day;
  final int userId;

  CartaoModel({
    this.id,
    required this.name,
    required this.digitos,
    required this.limitValue,
    required this.day,
    required this.userId,
  });

  factory CartaoModel.fromMap(Map<String, dynamic> map) {
    return CartaoModel(
      id: map['id'],
      name: map['name'],
      digitos: map['digitos'],
      limitValue: map['limit_value'],
      day: map['day'],
      userId: map['user_id'],
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
