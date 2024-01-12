import 'dart:io';
import 'package:recruitment/features/news/data/models/fetch_news_response.dart';
import 'package:recruitment/features/news/domain/repositories/articles_repository.dart';
import '../data_sources/news_data_source.dart';

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
