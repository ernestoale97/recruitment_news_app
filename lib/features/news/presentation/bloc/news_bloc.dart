import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/articles_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ArticleRepository _articleRepository;
  NewsBloc(this._articleRepository,) : super(FetchingNewsState()) {
    on<FetchNewsEvent>(_fetchNews);
  }

  Future<void> _fetchNews(FetchNewsEvent event, Emitter<NewsState> emit) async {
    emit(FetchingNewsState());
    try {
      final data = await _articleRepository.getArticles();
      emit(FetchedNewsState(data.data!));
    } on Object catch (e) {
      emit(FetchFailNewsState());
    }
  }
}
