import 'package:flutter/cupertino.dart';

class CardData {
  CardData({
    required this.name,
    required this.balance,
    required this.last4Digits,
    required this.expirationDate,
    required this.provider,
    required this.color,
  });
  final Color color;
  final String name, balance, last4Digits, expirationDate;
  final ImageProvider<Object> provider;
}
