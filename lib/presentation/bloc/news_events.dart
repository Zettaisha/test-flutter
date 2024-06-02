import 'package:equatable/equatable.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();
}

class FetchArticles extends ArticlesEvent {
  @override
  List<Object> get props => [];
}

class MarkArticleVisited extends ArticlesEvent {
  final String articleId;

  const MarkArticleVisited(this.articleId);

  @override
  List<Object> get props => [articleId];
}
