import 'package:recruitment/core/resources/fetch-news-response.dart';

abstract class ArticleRepository {
  Future<FetchNewsResponse> getArticles();
}