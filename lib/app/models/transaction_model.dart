class TransactionModel {
  final int id;
  final int cartaoId;
  final DateTime date;
  final String title;
  final double amount;
  final String? parcelas;

  TransactionModel({
    required this.id,
    required this.cartaoId,
    required this.date,
    required this.title,
    required this.amount,
    this.parcelas,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        cartaoId: json['cartaoId'],
        date: DateTime.parse(json['date']),
        title: json['title'],
        amount: (json['amount'] as num).toDouble(),
        parcelas: json['parcelas'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'cartaoId': cartaoId,
    'date': date.toIso8601String(),
    'title': title,
    'amount': amount,
    'parcelas': parcelas,
  };
}
