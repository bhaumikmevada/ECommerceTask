
abstract class CategoryState{
  
}
class CategoryInitState extends CategoryState{}
class CategoryLoadingState extends CategoryState{}
class CategoryResponseState extends CategoryState{
  List<String> response;
  CategoryResponseState(this.response);
}
class CategoryErrorState extends CategoryState{
  String message;
  CategoryErrorState(this.message);
}