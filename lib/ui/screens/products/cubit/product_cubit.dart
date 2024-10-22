
import 'package:ecommerce_task/api_services/ApiService.dart';
import 'package:ecommerce_task/ui/screens/categories/cubit/category_state.dart';
import 'package:ecommerce_task/ui/screens/products/cubit/product_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{

  ApiService apiService;

  ProductCubit(this.apiService) : super(ProductInitState());

  void productCategoryWise(String id) async{

    emit(ProductLoadingState());

    try{
      dynamic model = await apiService.productCategoryWise(id);
      debugPrint("cubit productcategory : $model");
      emit(ProductResponseState(model));

    }catch(e){
      emit(ProductErrorState(e.toString()));
    }
  }
}