import 'package:test_flutter/domain/repository/abstract_news_repository.dart';
import 'package:test_flutter/data/data_sources/local/mock_featured_articles.dart';
import 'package:test_flutter/data/data_sources/local/mock_latest_articles.dart';
import 'package:test_flutter/data/models/article.dart';

class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<List<Article>> getLatestArticles() async {
    return mockLatestArticles;
  }

  @override
  Future<Article> getArticle(String id) async {
    return mockLatestArticles.firstWhere(
      (e) => e.id == id,
      orElse: () => mockFeaturedArticles.firstWhere((e) => e.id == id),
    );
  }

  @override
  Future<List<Article>> getFeaturedArticles() async {
    return mockFeaturedArticles;
  }

  // TODO: метод, который будет переносить Article из Featured в Latest (доп. задание)
}
