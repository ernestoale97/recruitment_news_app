import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment/features/news/data/models/article.dart';
import '../../domain/repositories/articles-repository.dart';
import 'news-event.dart';
import 'news-state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ArticleRepository _articleRepository;
  NewsBloc(this._articleRepository,) : super(FetchingNewsState()) {
    on<FetchNewsEvent>(_handleFetchNews);
  }

  Future<void> _handleFetchNews(
      FetchNewsEvent event,
      Emitter<NewsState> emit,
      ) async {
    emit(FetchingNewsState());
    try {
      final data = await _articleRepository.getArticles();
      emit(FetchedNewsState(data.data!));
    } on Object catch (e) {
      emit(FetchFailNewsState());
    }
  }
}
