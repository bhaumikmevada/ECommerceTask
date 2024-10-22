
import 'package:ecommerce_task/ui/screens/products/model/CategoryProductModel.dart';

import '../model/ProductModel.dart';

abstract class CategoryProductListState{
  
}
class CategoryProductListInitState extends CategoryProductListState{}
class CategoryProductListLoadingState extends CategoryProductListState{}
class CategoryProductListResponseState extends CategoryProductListState{
  List<CategoryProductModel> model;
  CategoryProductListResponseState(this.model);
}
class CategoryProductListErrorState extends CategoryProductListState{
  String message;
  CategoryProductListErrorState(this.message);
}