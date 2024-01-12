import 'dart:io';
import 'package:recruitment/features/news/domain/entities/fetch_news_response.dart';
import 'package:recruitment/features/news/domain/repositories/news_repository.dart';
import 'package:recruitment/features/news/data/data_sources/news_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl(this._newsDataSource);
  final NewsDataSource _newsDataSource;

  @override
  Future<FetchNewsResponse> fetchNews() async {
    try {
      return await _newsDataSource.fetchNews();
    } on HttpException catch(e) {
      return FetchNewsFailed(e);
    }
  }
}
