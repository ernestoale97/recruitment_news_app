import 'package:recruitment/features/news/domain/entities/fetch_news_response.dart';

abstract class NewsRepository {
  Future<FetchNewsResponse> fetchNews();
}