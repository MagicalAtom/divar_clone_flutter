import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sanjagh/data/models/Category.dart';
import 'package:sanjagh/data/repositories/category/category_repository_interface.dart';

part 'last_category_state.dart';

class LastCategoryCubit extends Cubit<LastCategoryState> {
  CategoryRepositoryInterFace categoryRepository;
  LastCategoryCubit(this.categoryRepository) : super(LastCategoryInitial());



  void add(Category category){
    categoryRepository.addLastCategories(category);
  }

  void get() async {
    final categories = await categoryRepository.getLastCategoriesView();  
    Future.delayed(const Duration(seconds: 1),(){
    emit(LastCategoryResponseState(categories));
    });
  }



}
