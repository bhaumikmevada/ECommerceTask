
import '../model/ProductModel.dart';

abstract class ProductState{
  
}
class ProductInitState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductResponseState extends ProductState{
  ProductModel model;
  ProductResponseState(this.model);
}
class ProductErrorState extends ProductState{
  String message;
  ProductErrorState(this.message);
}