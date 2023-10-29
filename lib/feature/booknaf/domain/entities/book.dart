class Book {
  final String id;
  final String category;
  final String title;
  final String description;
  final String duration;
  final String image;
  final double rating;
  final DateTime createdAt;

  Book({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.duration,
    required this.image,
    required this.rating,
    required this.createdAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      duration: json['duration'] as String,
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
