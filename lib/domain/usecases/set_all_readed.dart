import 'package:test_flutter/domain/repository/abstract_news_repository.dart';

class MarkAllReaded {
  final NewsRepository _repository;

  MarkAllReaded(this._repository);

  Future<void> call() async {
    await _repository.setAllReaded();
  }
}
