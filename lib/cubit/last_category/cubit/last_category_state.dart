part of 'last_category_cubit.dart';

abstract class LastCategoryState  {

}

final class LastCategoryInitial extends LastCategoryState {}




class LastCategoryResponseState extends LastCategoryState {
  List categories;
  LastCategoryResponseState(this.categories);
} 