import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_orange/layout/cubit/states.dart';
import 'package:pet_orange/models/login_model.dart';
import 'package:pet_orange/modules/Login/cubit/states.dart';
import 'package:pet_orange/modules/Request/cubit/states.dart';
import 'package:pet_orange/shared/network/network.dart';

import '../../../shared/network/end_points.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility_outlined :  Icons.visibility_off_outlined  ;
    emit(RegisterChangePasswordVisibility());
  }

  LoginModel? loginModel;

  void UserLogin({
    required String email,
    required String password,
}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
        },
    ).then((value) => {
      loginModel = LoginModel.fromJson(value.data),
      print(loginModel),
      emit(LoginSuccessState(loginModel!)),
    }).catchError((error)=>{
      print(error.toString()),
      emit(LoginFailState()),
    });
  }

}