
import 'package:ecommerce_task/api_services/ApiService.dart';
import 'package:ecommerce_task/ui/screens/categories/cubit/category_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState>{

  ApiService apiService;

  CategoryCubit(this.apiService) : super(CategoryInitState());

  void categoryList() async{

    emit(CategoryLoadingState());

    try{
      dynamic model = await apiService.categories();
      debugPrint("cubit category : $model");
      emit(CategoryResponseState(model!));

    }catch(e){
      emit(CategoryErrorState(e.toString()));
    }
  }
}