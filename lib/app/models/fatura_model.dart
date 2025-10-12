class FaturaModel {
  final int? id;
  final String title;
  final double amount;
  final DateTime date;
  final int parcelas;

  FaturaModel({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.parcelas,
  });

  factory FaturaModel.fromMap(Map<String, dynamic> map) {
    DateTime parsedDate;

    final rawDate = map['date'];

    if (rawDate == null) {
      parsedDate = DateTime.now();
    } else if (rawDate is int) {
      // caso o SQLite tenha salvo como timestamp
      parsedDate = DateTime.fromMillisecondsSinceEpoch(rawDate);
    } else if (rawDate is String) {
      // tenta converter string ISO ou simples (yyyy-MM-dd)
      try {
        parsedDate = DateTime.parse(rawDate);
      } catch (_) {
        // tenta manualmente quebrar se vier no formato errado
        parsedDate = DateTime.tryParse(rawDate) ?? DateTime.now();
      }
    } else {
      parsedDate = DateTime.now();
    }

    return FaturaModel(
      id: map['id'] is int ? map['id'] : int.tryParse('${map['id']}'),
      title: map['title'] ?? '',
      amount: map['amount'] is num
          ? (map['amount'] as num).toDouble()
          : double.tryParse('${map['amount']}') ?? 0.0,
      date: parsedDate,
      parcelas: map['parcelas'] is int
          ? map['parcelas']
          : int.tryParse('${map['parcelas']}') ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'parcelas': parcelas,
    };
  }
}
