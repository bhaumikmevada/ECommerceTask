
import 'package:ecommerce_task/api_services/ApiService.dart';
import 'package:ecommerce_task/ui/screens/categories/cubit/category_state.dart';
import 'package:ecommerce_task/ui/screens/products/cubit/category_productlist_state.dart';
import 'package:ecommerce_task/ui/screens/products/cubit/product_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductListCubit extends Cubit<CategoryProductListState>{

  ApiService apiService;

  CategoryProductListCubit(this.apiService) : super(CategoryProductListInitState());

  void categoryProductList(String id) async{

    emit(CategoryProductListLoadingState());

    try{
      dynamic model = await apiService.categoryProductList(id);
      debugPrint("cubit category : $model");
      emit(CategoryProductListResponseState(model!));

    }catch(e){
      emit(CategoryProductListErrorState(e.toString()));
    }
  }
}