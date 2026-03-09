// lib/data/favorites_data.dart

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

List<Map<String, dynamic>> favoriteShops = [];

// ✅ Favorites save karo
Future<void> saveFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  String encoded = jsonEncode(favoriteShops);
  await prefs.setString('favoriteShops', encoded);
}

// ✅ Favorites load karo
Future<void> loadFavorites() async {
  final prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString('favoriteShops');
  if (data != null) {
    favoriteShops = List<Map<String, dynamic>>.from(jsonDecode(data));
  }
}