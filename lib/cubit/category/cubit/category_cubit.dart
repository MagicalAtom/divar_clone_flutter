import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sanjagh/helpers/saveFormValue.dart';
import 'package:sanjagh/screens/categories/widgets/category_items_widget.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryStateCubit> {
  SaveFormValue saveFormValue;
  CategoryCubit(this.saveFormValue) : super(CategoryInitial());


  void setItem(String id,String name) async {
    emit(CategoryLoading());
    await saveFormValue.saveFormValue(CategoryItemWidget.categoryName, name);
    await saveFormValue.saveFormValue(CategoryItemWidget.categoryId, id);
    emit(CategoryUpdateSuccessful());
  }


  void getItem(){
    emit(CategoryLoading());
    String name = saveFormValue.getFormValue(CategoryItemWidget.categoryName);
    String id = saveFormValue.getFormValue(CategoryItemWidget.categoryId);
    emit(CategoryUpdate(name, id));
  }



}
