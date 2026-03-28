import 'package:equatable/equatable.dart';

class NewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  const NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] as String? ?? 'unknown',
      totalResults: json['totalResults'] as int? ?? 0,
      articles: (json['articles'] as List? ?? [])
          .map((e) => Article.fromJson(e as Map<String, dynamic>? ?? {}))
          .toList(),
    );
  }

  @override
  List<Object> get props => [status, totalResults, articles];
}

class Article extends Equatable {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source'] as Map<String, dynamic>? ?? {}),

      author: json['author'] as String? ?? 'Unknown Author',

      title: json['title'] as String? ?? 'No Title',

      description: json['description'] as String? ?? 'No Description Available',

      url: json['url'] as String? ?? '',

      urlToImage: json['urlToImage'] as String? ?? 'assets/defultimage.jpg',

      publishedAt: json['publishedAt'] as String? ?? '',

      content: json['content'] as String? ?? 'No Content Available',
    );
  }

  @override
  List<Object> get props => [
    source,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
}

class Source extends Equatable {
  final String id;
  final String name;

  const Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String? ?? 'no-id',
      name: json['name'] as String? ?? 'Unknown Source',
    );
  }

  @override
  List<Object> get props => [id, name];
}
