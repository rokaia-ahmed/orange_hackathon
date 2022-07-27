import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_orange/models/sign_up_model.dart';
import 'package:pet_orange/modules/Sing_Up/cubit/states.dart';
import 'package:pet_orange/shared/network/end_points.dart';
import 'package:pet_orange/shared/network/network.dart';

class SingUpCubit extends Cubit<SingUpStates> {
  SingUpCubit() : super(SingUpInitialStates());

  static SingUpCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibility());
  }

  SignUpModel? singUpModel;

  void UserSingup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,

    required String country,
  }) {
    emit(SingUpLoadingState());
    DioHelper.postData(
      url: SIGNUP,
      data: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,

        'country': country,
      },
    )
        .then((value) => {
              singUpModel = SignUpModel.fromJson(value.data),
              print(singUpModel),
              emit(SingUpSuccessState(singUpModel!)),
            })
        .catchError((error) => {
              print(error.toString()),
              emit(SingUpFailState()),
            });
  }
}
