import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment/features/news/domain/use_cases/fetch_news_usecase.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final FetchNewsUseCase _fetchNewsUseCase;
  NewsBloc(this._fetchNewsUseCase,) : super(FetchingNewsState()) {
    on<FetchNewsEvent>(_fetchNews);
  }

  Future<void> _fetchNews(FetchNewsEvent event, Emitter<NewsState> emit) async {
    emit(FetchingNewsState());
    try {
      final data = await _fetchNewsUseCase.call();
      emit(FetchedNewsState(data.data!));
    } on Object catch (_) {
      emit(FetchFailNewsState());
    }
  }
}
