// // ✅ Bas itna hi likho - koi widget nahi


import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CartItem {
  final int index;
  final String name;
  final String image;
  final int price;
  int quantity;

  CartItem({
    required this.index,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  // ✅ toJson add karo
  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  // ✅ fromJson add karo
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      index: json['index'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}

class OrderHistory {
  final List<CartItem> items;
  final int total;
  final DateTime date;

  OrderHistory({
    required this.items,
    required this.total,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'date': date.toIso8601String(),
    };
  }

  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      items: (json['items'] as List).map((item) => CartItem.fromJson(item)).toList(),
      total: json['total'],
      date: DateTime.parse(json['date']),
    );
  }
}

// ✅ Sirf ek baar declare karo
List<CartItem> cartItems = [];
List<OrderHistory> orderHistory = [];

int get totalPrice {
  return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
}

// ✅ History save karo
Future<void> saveOrderHistory() async {
  final prefs = await SharedPreferences.getInstance();
  String encoded = jsonEncode(orderHistory.map((o) => o.toJson()).toList());
  await prefs.setString('orderHistory', encoded);
}

// ✅ History load karo
Future<void> loadOrderHistory() async {
  final prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString('orderHistory');
  if (data != null) {
    List decoded = jsonDecode(data);
    orderHistory = decoded.map((o) => OrderHistory.fromJson(o)).toList();
  }
}

// class CartItem {
//   final int index;
//   final String name;
//   final String image;
//   final int price;
//   int quantity;

//   CartItem({
//     required this.index,
//     required this.name,
//     required this.image,
//     required this.price,
//     this.quantity = 1,
//   });
// }




// List<CartItem> cartItems = [];
// int get totalPrice {
//   return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
// }

// class OrderHistory {
//   final List<CartItem> items;
//   final int total;
//   final DateTime date;

//   OrderHistory({
//     required this.items,
//     required this.total,
//     required this.date,
//   });
// }

// // ✅ Global history list
// List<OrderHistory> orderHistory = [];