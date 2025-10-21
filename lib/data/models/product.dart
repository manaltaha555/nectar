class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final int weight;
  final List<String> tags;
  final List<String> images;
  final double discountPercentage;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.tags,
    required this.images,  
    required this.weight,  
    required this.description,
    required this.discountPercentage,
  });

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
      id: jsonData['id'],
      title: jsonData['title'],
      price: (jsonData['price'] as num).toDouble(),
      rating: (jsonData['rating'] as num).toDouble(),
      weight: (jsonData['weight'] as num).toInt(),
      tags: List<String>.from(jsonData['tags']),
      images: List<String>.from(jsonData['images']),
      description: jsonData['description'],
      discountPercentage: (jsonData['discountPercentage'] as num).toDouble(),
    );
  }
}
