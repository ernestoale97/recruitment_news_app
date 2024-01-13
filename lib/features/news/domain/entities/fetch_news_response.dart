import 'package:recruitment/features/news/data/models/article.dart';

abstract class FetchNewsResponse {
  final List<Article>? data;
  final Exception? error;

  const FetchNewsResponse({this.data, this.error});
}

class FetchNewsSuccess extends FetchNewsResponse {
  const FetchNewsSuccess(List<Article> data) : super(data: data);
}

class FetchNewsFailed extends FetchNewsResponse {
  const FetchNewsFailed(Exception? error) : super(error: error);
}