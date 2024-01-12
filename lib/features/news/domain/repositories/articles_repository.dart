import 'package:recruitment/features/news/domain/entities/fetch_news_response.dart';

abstract class ArticleRepository {
  Future<FetchNewsResponse> getArticles();
}