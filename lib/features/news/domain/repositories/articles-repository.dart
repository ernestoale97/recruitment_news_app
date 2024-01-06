import 'package:recruitment/features/news/domain/entities/article-entity.dart';

abstract class ArticleRepository {
  Future<List<ArticleEntity>> getArticles();
}