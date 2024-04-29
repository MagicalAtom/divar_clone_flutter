part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategoryRequestState extends CategoryState {
  Either<ApiException,List<Category>> categories;
  CategoryRequestState(this.categories);
}


final class CategoryHistoryState extends CategoryState {
  List categories;
  CategoryHistoryState(this.categories);
}

final class CategoryRequestError extends CategoryState {}