import 'package:recruitment/features/news/data/models/fetch_news_response.dart';

abstract class ArticleRepository {
  Future<FetchNewsResponse> getArticles();
}