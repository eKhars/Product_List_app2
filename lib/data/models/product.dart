class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String? category;
  final String? imageUrl;
  final double? rating;
  final int? ratingCount;

  Product({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.price,
    this.category,
    this.imageUrl,
    this.rating,
    this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      imageUrl: json['image'],
      rating: json['rating'] != null ? (json['rating']['rate'] as num).toDouble() : null,
      ratingCount: json['rating'] != null ? json['rating']['count'] : null,
    );
  }
}