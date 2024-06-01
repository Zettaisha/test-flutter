import 'package:get_it/get_it.dart';
import 'package:test_flutter/data/repository/news_repository_impl.dart';
import 'package:test_flutter/domain/repository/abstract_news_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // dependencies
  sl.registerSingleton<NewsRepository>(NewsRepositoryImpl());
}
