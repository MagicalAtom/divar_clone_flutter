part of 'category_cubit.dart';

sealed class CategoryStateCubit extends Equatable {
  const CategoryStateCubit();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryStateCubit {}

final class CategoryLoading extends CategoryStateCubit {}


final class CategoryUpdateSuccessful extends CategoryStateCubit {}


final class CategoryUpdate extends CategoryStateCubit {
  String name;
  String id;

  CategoryUpdate(this.name,this.id);
}
