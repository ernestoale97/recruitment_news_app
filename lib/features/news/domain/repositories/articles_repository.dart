import 'package:recruitment/core/resources/fetch_news_response.dart';

abstract class ArticleRepository {
  Future<FetchNewsResponse> getArticles();
}