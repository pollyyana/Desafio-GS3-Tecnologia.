class TransactionModel {
  final int? id;
  final int cartaoId;
  final String date;
  final String title;
  final double amount;
  final String? parcelas;

  TransactionModel({
    this.id,
    required this.cartaoId,
    required this.date,
    required this.title,
    required this.amount,
    this.parcelas,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      cartaoId: map['cartao_id'],
      date: map['date'],
      title: map['title'],
      amount: map['amount'],
      parcelas: map['parcelas'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cartao_id': cartaoId,
      'date': date,
      'title': title,
      'amount': amount,
      'parcelas': parcelas,
    };
  }
}
