

class GroceryEntity {
  final String id;
  final String title;
  final double rating;
  final String imageUrl;
  final double price;
  final double discount;
  final String description;
  final List<dynamic> options;

  GroceryEntity ({
    required this.id,
    required this.title,
    required this.rating,
    required this.price,
    required this.discount,
    required this.description,
    required this.options,
    required this.imageUrl
  });
  
}