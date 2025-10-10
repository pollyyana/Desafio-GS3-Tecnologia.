class FaturaModel {
  final int id;
  final int cartaoId;
  final String title;
  final double amount;
  final DateTime date;
  final String? parcelas;

  FaturaModel({
    required this.id,
    required this.cartaoId,
    required this.title,
    required this.amount,
    required this.date,
    this.parcelas,
  });

  factory FaturaModel.fromJson(Map<String, dynamic> json) {
    return FaturaModel(
      id: json['id'],
      cartaoId: json['cartaoId'],
      title: json['title'],
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date']),
      parcelas: json['parcelas'],
    );
  }
}
