import 'package:flutter/material.dart';

class CartaoModel {
  final int id;
  final String bankName;
  final String lastDigits;
  final double availableLimit;
  final int bestPurchaseDay;
  final int userId;

  // Campos apenas de UI (não vêm do backend)
  final VoidCallback? onEyePressed;
  final ImageProvider? logo;

  const CartaoModel({
    required this.id,
    required this.bankName,
    required this.lastDigits,
    required this.availableLimit,
    required this.bestPurchaseDay,
    required this.userId,
    this.onEyePressed,
    this.logo,
  });

  /// 🧩 Factory compatível com `json_rest_server`
  factory CartaoModel.fromJson(Map<String, dynamic> json) {
    return CartaoModel(
      id: json['id'] as int,
      bankName: json['bankName'] as String,
      lastDigits: json['lastDigits'] as String,
      availableLimit: (json['availableLimit'] as num).toDouble(),
      bestPurchaseDay: json['bestPurchaseDay'] as int,
      userId: json['userId'] as int,
    );
  }

  /// 🔁 Converte para JSON (para envio via API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bankName': bankName,
      'lastDigits': lastDigits,
      'availableLimit': availableLimit,
      'bestPurchaseDay': bestPurchaseDay,
      'userId': userId,
    };
  }

  /// 🧱 Copia com novos valores (imutável, estilo copyWith)
  CartaoModel copyWith({
    int? id,
    String? bankName,
    String? lastDigits,
    double? availableLimit,
    int? bestPurchaseDay,
    int? userId,
    VoidCallback? onEyePressed,
    ImageProvider? logo,
  }) {
    return CartaoModel(
      id: id ?? this.id,
      bankName: bankName ?? this.bankName,
      lastDigits: lastDigits ?? this.lastDigits,
      availableLimit: availableLimit ?? this.availableLimit,
      bestPurchaseDay: bestPurchaseDay ?? this.bestPurchaseDay,
      userId: userId ?? this.userId,
      onEyePressed: onEyePressed ?? this.onEyePressed,
      logo: logo ?? this.logo,
    );
  }
}
