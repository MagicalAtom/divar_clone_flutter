part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}


final class CategoryRequestEvent extends CategoryEvent {}

final class AddHistoryCategoryEvent extends CategoryEvent {
  final category;
  AddHistoryCategoryEvent(this.category);
}

final class GetHistoryCategoryEvent extends CategoryEvent {}