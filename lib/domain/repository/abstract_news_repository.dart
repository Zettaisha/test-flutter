import 'package:test_flutter/data/models/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getLatestArticles();
  Future<List<Article>> getFeaturedArticles();
  Future<Article> getArticle(String id);
  Future<void> setArticleVisited(String id);
  Future<void> setAllReaded();
}
