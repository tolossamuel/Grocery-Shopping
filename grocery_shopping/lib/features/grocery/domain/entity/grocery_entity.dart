

class GroceryEntity {
  final String id;
  final String title;
  final double rating;
  final double price;
  final double discount;
  final String description;
  final List<Map<String,dynamic>> options;

  GroceryEntity ({
    required this.id,
    required this.title,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options
  });
  
}