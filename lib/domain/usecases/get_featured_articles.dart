import 'package:test_flutter/data/models/article.dart';
import 'package:test_flutter/domain/repository/abstract_news_repository.dart';

class GetFeaturedArticles {
  final NewsRepository _repository;

  GetFeaturedArticles(this._repository);

  Future<List<Article>> call() {
    return _repository.getFeaturedArticles();
  }
}
