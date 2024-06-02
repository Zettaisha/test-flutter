import 'package:test_flutter/domain/repository/abstract_news_repository.dart';

class SetArticleVisited {
  final NewsRepository _repository;

  SetArticleVisited(this._repository);

  Future<void> call(String id) async {
    await _repository.setArticleVisited(id);
  }
}
