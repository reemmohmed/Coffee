part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitSuccess extends HomeCubitState {}

final class HomeCubitError extends HomeCubitState {}
