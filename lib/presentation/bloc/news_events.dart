import 'package:equatable/equatable.dart';

// События
abstract class ArticlesEvent extends Equatable {
  const ArticlesEvent();
}

class FetchArticles extends ArticlesEvent {
  @override
  List<Object> get props => [];
}
