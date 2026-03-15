import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ✅ Global location variables
double? userLat;
double? userLng;
String? userAddress;

// ✅ Location permission check karo
Future<bool> checkPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return false;
  }
  return true;
}

// ✅ Current location lo
Future<void> getCurrentLocation() async {
  bool hasPermission = await checkPermission();
  if (!hasPermission) return;

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  userLat = position.latitude;
  userLng = position.longitude;

  // ✅ Save karo
  final prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('userLat', userLat!);
  await prefs.setDouble('userLng', userLng!);
}

// ✅ Saved location load karo
Future<void> loadSavedLocation() async {
  final prefs = await SharedPreferences.getInstance();
  userLat = prefs.getDouble('userLat');
  userLng = prefs.getDouble('userLng');
}