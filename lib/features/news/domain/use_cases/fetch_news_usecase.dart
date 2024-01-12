import 'package:recruitment/features/news/domain/entities/fetch_news_response.dart';
import 'package:recruitment/features/news/domain/repositories/news_repository.dart';

class FetchNewsUseCase {
  final NewsRepository repository;
  FetchNewsUseCase(this.repository);

  Future<FetchNewsResponse> call() async {
    return await repository.fetchNews();
  }
}
