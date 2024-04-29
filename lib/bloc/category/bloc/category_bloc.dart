import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sanjagh/configs/ApiException.dart';
import 'package:sanjagh/data/models/Category.dart';
import 'package:sanjagh/data/repositories/category/category_repository_interface.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepositoryInterFace categoryRepository;
  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
   on<CategoryRequestEvent>((event, emit) async {
     try {
       emit(CategoryLoadingState());
       final categories = await categoryRepository.getCategories();
       emit(CategoryRequestState(categories));
     }catch(e){
       emit(CategoryRequestError());
     }
   });


   on<GetHistoryCategoryEvent>((event, emit) {
    final categories = categoryRepository.getLastCategoriesView();
    emit(CategoryHistoryState(categories));
   });


  on<AddHistoryCategoryEvent>((event, emit) {
    categoryRepository.addLastCategories(event.category);
  },);


  }
}
