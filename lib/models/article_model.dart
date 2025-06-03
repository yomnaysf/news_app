class ArticleModel {
  final String title;
  final String? author;
  final String? image;
  final String? publishedAt;
  final String? category;
  final String? content;
  final String? description;

  ArticleModel({
    required this.title,
    required this.author,
    required this.image,
    this.publishedAt,
    this.category,
    this.content,
    this.description,
  });

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      title: json['title'],
      author: json['author'],
      image: json['urlToImage'],
      publishedAt: json['publishedAt'],
      category: json['category'],
      content: json['content'],
      description: json['description'],
    );
  }
}
