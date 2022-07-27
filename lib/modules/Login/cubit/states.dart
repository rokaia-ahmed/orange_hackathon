import 'package:pet_orange/models/login_model.dart';

abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class RegisterChangePasswordVisibility extends LoginStates {}

class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginFailState extends LoginStates{}



