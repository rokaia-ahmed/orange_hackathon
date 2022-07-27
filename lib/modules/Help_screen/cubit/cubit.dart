import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_orange/layout/cubit/states.dart';
import 'package:pet_orange/modules/Help_screen/cubit/states.dart';

import '../../../shared/network/end_points.dart';
import '../../../shared/network/network.dart';


class HelpCubit extends Cubit<HelpStates> {
  HelpCubit() : super(HelpInitialStates());
  static HelpCubit get(context) => BlocProvider.of(context);



  void helpRequest({
    required int categoryId ,
    required String image ,
    required String location ,
    required String phoneNumber ,
})async {
    emit(HelpLoadingState());
    await DioHelper.postData(
        url: HELP,
        token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OTksImVtYWlsIjoiYWRoYW1AZ21haWwuY29tIiwiaWF0IjoxNjU4OTE3ODIzLCJleHAiOjE2NTkwMDQyMjN9.K38egXY9AWefy_1kJDtOlALunt6HQoMiilA6rLqtE0g',
        data:{
          'categoryId' : categoryId ,
          'imageBase64' : 'data:image/jpeg;base64,$image' ,
          'location' : location ,
          'phoneNumber' : phoneNumber ,
        }).then((value){
          print(value) ;
          emit(HelpSuccessState());
    }).catchError((error){
      if(error is DioError){
        print('${error.response} ===================');
        emit(HelpErrorState(error.toString()));
      }
    });
  }
  
}