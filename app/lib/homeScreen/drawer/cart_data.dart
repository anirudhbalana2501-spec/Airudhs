// ✅ Bas itna hi likho - koi widget nahi

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
}

List<CartItem> cartItems = [];
int get totalPrice {
  return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
}