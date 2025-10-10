import 'package:flutter/material.dart';

class CartaoModel {
  final int id;
  final String bankName;
  final int lastDigits;
  final double availableLimit;
  final int bestPurchaseDay;
  final ImageProvider? logo;
  final VoidCallback? onEyePressed;

  CartaoModel({
    required this.id,
    required this.bankName,
    required this.lastDigits,
    required this.availableLimit,
    required this.bestPurchaseDay,
    this.logo,
    this.onEyePressed,
  });

  factory CartaoModel.fromJson(Map<String, dynamic> json) {
    return CartaoModel(
      id: json['id'],
      bankName: json['name'],
      lastDigits: json['digitos'],
      availableLimit: (json['limit'] as num).toDouble(),
      bestPurchaseDay: json['day'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': bankName,
    'digitos': lastDigits,
    'limit': availableLimit,
    'day': bestPurchaseDay,
  };
}
