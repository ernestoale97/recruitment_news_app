import 'package:equatable/equatable.dart';
import 'package:recruitment/features/news/data/models/article.dart';
import 'package:recruitment/features/news/domain/entities/article-entity.dart';

class NewsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class InitialNewsState extends NewsState {}

class FetchingNewsState extends NewsState {}

class FetchedNewsState extends NewsState {
  FetchedNewsState(this.news);
  final List<Article> news;

  @override
  List<Object> get props => [news];
}

class FetchFailNewsState extends NewsState {}