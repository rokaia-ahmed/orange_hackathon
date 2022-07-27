
import 'package:pet_orange/modules/Sing_Up/cubit/cubit.dart';

import '../../../models/sign_up_model.dart';

abstract class SingUpStates {}

class SingUpInitialStates extends SingUpStates {}

class RegisterChangePasswordVisibility extends SingUpStates {}

class SingUpLoadingState extends SingUpStates{}
class SingUpSuccessState extends SingUpStates{
  final SignUpModel singUpModel;
  SingUpSuccessState(this.singUpModel);
}
class SingUpFailState extends SingUpStates{}



