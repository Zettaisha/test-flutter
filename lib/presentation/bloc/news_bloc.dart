import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/usecases/get_featured_articles.dart';
import 'package:test_flutter/domain/usecases/get_latest_articles.dart';
import 'package:test_flutter/domain/usecases/set_all_readed.dart';
import 'package:test_flutter/domain/usecases/set_article_visited.dart';
import 'package:test_flutter/presentation/bloc/news_events.dart';
import 'package:test_flutter/presentation/bloc/news_states.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetLatestArticles getLatestArticles;
  final GetFeaturedArticles getFeaturedArticles;
  final SetArticleVisited setArticleVisited;
  final MarkAllReaded setMarkAllReaded;

  ArticlesBloc({
    required this.setMarkAllReaded,
    required this.getLatestArticles,
    required this.getFeaturedArticles,
    required this.setArticleVisited,
  }) : super(ArticlesInitial()) {
    on<FetchArticles>(_onFetchArticles);
    on<MarkArticleVisitedEvent>(_onMarkArticleVisited);
    on<MarkAllReadedEvent>(_onMarkAllArticlesRead);
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
      MarkArticleVisitedEvent event, Emitter<ArticlesState> emit) async {
    try {
      await setArticleVisited(event.articleId);

      if (state is ArticlesLoaded) {
        final currentState = state as ArticlesLoaded;
        final latestArticles = currentState.latestArticles.map((article) {
          if (article.id == event.articleId) {
            return article.copyWith(readed: true);
          }
          return article;
        }).toList();

        final featuredArticles = currentState.featuredArticles.map((article) {
          if (article.id == event.articleId) {
            return article.copyWith(readed: true);
          }
          return article;
        }).toList();

        emit(ArticlesLoaded(
          latestArticles: latestArticles,
          featuredArticles: featuredArticles,
        ));
      }
    } catch (e) {
      emit(ArticlesError(e.toString()));
    }
  }

  Future<void> _onMarkAllArticlesRead(
      MarkAllReadedEvent event, Emitter<ArticlesState> emit) async {
    try {
      await setMarkAllReaded();
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
}
