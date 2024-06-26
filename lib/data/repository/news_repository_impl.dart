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

  @override
  Future<void> setArticleVisited(String id) async {
    var article = mockLatestArticles.firstWhere(
      (e) => e.id == id,
      orElse: () => mockFeaturedArticles.firstWhere((e) => e.id == id),
    );
    if (mockLatestArticles.contains(article)) {
      int index = mockLatestArticles.indexOf(article);
      mockLatestArticles[index] = article.copyWith(readed: true);
    } else {
      int index = mockFeaturedArticles.indexOf(article);
      mockFeaturedArticles[index] = article.copyWith(readed: true);
    }
  }

  @override
  Future<void> setAllReaded() async {
    for (var i = 0; i < mockFeaturedArticles.length; i++) {
      mockFeaturedArticles[i] = mockFeaturedArticles[i].copyWith(readed: true);
    }

    for (var i = 0; i < mockLatestArticles.length; i++) {
      mockLatestArticles[i] = mockLatestArticles[i].copyWith(readed: true);
    }
  }
}
