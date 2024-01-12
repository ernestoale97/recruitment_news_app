import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:recruitment/core/constants/constants.dart';
import 'package:recruitment/core/resources/fetch_news_response.dart';
import 'package:recruitment/features/news/data/models/article.dart';

class NewsDataSource {
  Future<FetchNewsResponse> getArticles() async {
    try {
      final uri = Uri.parse("$newsApiUrl/top-headlines?country=$newsQueryCountry&category=$newsQueryCategory&apiKey=$newsApiKey");
      http.Response response = await http.get(uri);
      final body = jsonDecode(response.body);
      List<Article> articles = List<Article>.from(body["articles"].map((x) => Article.fromJson(x)));
      return FetchNewsSuccess(articles);
    } on HttpException catch(e) {
      return FetchNewsFailed(e);
    }
  }
}
