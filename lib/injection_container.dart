import 'package:get_it/get_it.dart';
import 'package:test_flutter/data/repository/news_repository_impl.dart';
import 'package:test_flutter/domain/repository/abstract_news_repository.dart';
import 'package:test_flutter/domain/usecases/get_featured_articles.dart';
import 'package:test_flutter/domain/usecases/get_latest_articles.dart';
import 'package:test_flutter/presentation/bloc/news_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // repository
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl());

  // bloc
  sl.registerFactory(() => ArticlesBloc(
        getLatestArticles: GetLatestArticles(sl<NewsRepository>()),
        getFeaturedArticles: GetFeaturedArticles(sl<NewsRepository>()),
      ));
}
