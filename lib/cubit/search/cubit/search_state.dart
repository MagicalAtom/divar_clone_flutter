part of 'search_cubit.dart';

abstract class SearchState {
}

final class SearchInitial extends SearchState {}

final class SearchOpenState extends SearchState {}

final class SearchCloseState extends SearchState {}