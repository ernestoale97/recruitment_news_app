import 'dart:io';
import 'package:recruitment/features/news/domain/repositories/articles-repository.dart';
import '../../domain/entities/article-entity.dart';
import '../data-sources/news-data-source.dart';

class ArticlesRepositoryImplementation implements ArticleRepository {
  const ArticlesRepositoryImplementation(this._newsDataSource);
  final NewsDataSource _newsDataSource;
  @override
  Future<List<ArticleEntity>> getArticles() async {
    try {
      final response = await _newsDataSource.getArticles();
      return [];
    } on HttpException catch(e) {
      return [];
    }
  }
}