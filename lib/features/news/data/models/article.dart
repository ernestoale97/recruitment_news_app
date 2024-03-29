import 'package:recruitment/core/constants/constants.dart';
import 'package:recruitment/features/news/domain/entities/article_source.dart';

import '../../domain/entities/article_entity.dart';

class Article extends ArticleEntity {
  const Article({
    super.id,
    super.source,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory Article.fromJson(Map<String, dynamic> map) {
    return Article(
      source: ArticleSource.fromJson(map['source']),
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] != null && map['urlToImage'] != "" ? map['urlToImage'] : defaultImage,
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  factory Article.fromEntity(ArticleEntity entity) {
    return Article(
        id: entity.id,
        source: entity.source,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content);
  }
}