
import '../model/LoginModel.dart';

abstract class LoginState{}

class LoginInitState extends LoginState{}
class LoginLoadingState extends LoginState{

}
class LoginResponseState extends LoginState{
  LoginModel model;
  LoginResponseState(this.model);
}
class LoginErrorState extends LoginState{
  String message;
  LoginErrorState(this.message);
}


