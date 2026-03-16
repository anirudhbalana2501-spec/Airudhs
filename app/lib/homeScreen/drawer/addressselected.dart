import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// ✅ Currently selected address
String? selectedAddressLabel;
String? selectedAddressText;
double? selectedLat;
double? selectedLng;

// ✅ Save selected address
Future<void> saveSelectedAddress(String label, String address, double lat, double lng) async {
  selectedAddressLabel = label;
  selectedAddressText = address;
  selectedLat = lat;
  selectedLng = lng;

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('selectedLabel', label);
  await prefs.setString('selectedAddress', address);
  await prefs.setDouble('selectedLat', lat);
  await prefs.setDouble('selectedLng', lng);
}

// ✅ Load selected address
Future<void> loadSelectedAddress() async {
  final prefs = await SharedPreferences.getInstance();
  selectedAddressLabel = prefs.getString('selectedLabel');
  selectedAddressText = prefs.getString('selectedAddress');
  selectedLat = prefs.getDouble('selectedLat');
  selectedLng = prefs.getDouble('selectedLng');
}