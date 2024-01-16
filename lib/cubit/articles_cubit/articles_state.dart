part of 'articles_cubit.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class ArticlesSuccess extends ArticlesState {}

final class ArticlesFailure extends ArticlesState {
  final String massError;

  ArticlesFailure({required this.massError});
}

final class ArticlesLoading extends ArticlesState {}
