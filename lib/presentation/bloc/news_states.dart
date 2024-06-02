import 'package:equatable/equatable.dart';
import 'package:test_flutter/data/models/article.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object?> get props => [];
}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoaded extends ArticlesState {
  final List<Article> featuredArticles;
  final List<Article> latestArticles;

  const ArticlesLoaded({
    required this.featuredArticles,
    required this.latestArticles,
  });

  @override
  List<Object?> get props => [featuredArticles, latestArticles];
}

class ArticlesError extends ArticlesState {
  final String message;

  const ArticlesError(this.message);

  @override
  List<Object?> get props => [message];
}
