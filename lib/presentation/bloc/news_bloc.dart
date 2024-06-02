import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/usecases/get_featured_articles.dart';
import 'package:test_flutter/domain/usecases/get_latest_articles.dart';
import 'package:test_flutter/domain/usecases/set_article_visited.dart';
import 'package:test_flutter/presentation/bloc/news_events.dart';
import 'package:test_flutter/presentation/bloc/news_states.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetLatestArticles getLatestArticles;
  final GetFeaturedArticles getFeaturedArticles;
  final SetArticleVisited setArticleVisited;

  ArticlesBloc({
    required this.getLatestArticles,
    required this.getFeaturedArticles,
    required this.setArticleVisited,
  }) : super(ArticlesInitial()) {
    on<FetchArticles>(_onFetchArticles);
    on<MarkArticleVisited>(_onMarkArticleVisited);
  }

  Future<void> _onFetchArticles(
      FetchArticles event, Emitter<ArticlesState> emit) async {
    emit(ArticlesLoading());
    try {
      final featuredArticles = await getFeaturedArticles();
      final latestArticles = await getLatestArticles();
      emit(ArticlesLoaded(
        featuredArticles: featuredArticles,
        latestArticles: latestArticles,
      ));
    } catch (e) {
      emit(ArticlesError(e.toString()));
    }
  }

  Future<void> _onMarkArticleVisited(
      MarkArticleVisited event, Emitter<ArticlesState> emit) async {
    try {
      await setArticleVisited(event.articleId);
    } catch (e) {
      emit(ArticlesError(e.toString()));
    }
  }
}
