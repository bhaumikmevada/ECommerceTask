
import 'package:ecommerce_task/api_services/ApiService.dart';
import 'package:ecommerce_task/ui/screens/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{

  ApiService apiService;

  LoginCubit(this.apiService) : super(LoginInitState());

  void login(String username,String password) async{

    emit(LoginLoadingState());

    try{
      final model = await apiService.login(username, password);
      emit(LoginResponseState(model!));

    }catch(e){
      emit(LoginErrorState(e.toString()));
    }
  }
}