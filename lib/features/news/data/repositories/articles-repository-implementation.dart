import 'dart:io';
import 'package:recruitment/core/resources/fetch-news-response.dart';
import 'package:recruitment/features/news/domain/repositories/articles-repository.dart';
import '../../domain/entities/article-entity.dart';
import '../data-sources/news-data-source.dart';

class ArticlesRepositoryImplementation implements ArticleRepository {
  const ArticlesRepositoryImplementation(this._newsDataSource);
  final NewsDataSource _newsDataSource;
  @override
  Future<FetchNewsResponse> getArticles() async {
    try {
      return await _newsDataSource.getArticles();
    } on HttpException catch(e) {
      return FetchNewsFailed(e);
    }
  }
}