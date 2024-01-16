part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailure extends HomeState {
  final String massError;

  HomeFailure({required this.massError});
}

final class HomeLoading extends HomeState {}
