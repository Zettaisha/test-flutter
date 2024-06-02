import 'package:equatable/equatable.dart';

abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();
}

class FetchArticles extends ArticlesEvent {
  @override
  List<Object> get props => [];
}

class MarkArticleVisitedEvent extends ArticlesEvent {
  final String articleId;

  const MarkArticleVisitedEvent(this.articleId);

  @override
  List<Object> get props => [articleId];
}

class MarkAllReadedEvent extends ArticlesEvent {
  const MarkAllReadedEvent();

  @override
  List<Object> get props => [];
}
