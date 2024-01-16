part of 'packages_cubit.dart';

@immutable
sealed class PackagesState {}

final class PackagesInitial extends PackagesState {}

final class PackagesSuccess extends PackagesState {}

final class PackagesFailure extends PackagesState {
  final String massError;

  PackagesFailure({required this.massError});
}

final class PackagesLoading extends PackagesState {}
