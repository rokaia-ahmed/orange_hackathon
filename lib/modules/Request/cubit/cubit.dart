import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_orange/layout/cubit/states.dart';
import 'package:pet_orange/models/filterDataModel.dart';
import 'package:pet_orange/modules/Request/cubit/states.dart';
import 'package:dio/dio.dart';

import '../../../shared/network/end_points.dart';
import '../../../shared/network/network.dart';


class RequestCubit extends Cubit<RequestStates> {
  RequestCubit() : super(RequestInitialStates());

  static RequestCubit get(context) => BlocProvider.of(context);

  PetsFilterModel? petsFilterModel;
  void getData(String categoryId){
    emit(RequestLoadingState());
    DioHelper.getData(
      url: '${PETSFILTER}${categoryId}'
    ).then((value) => {
      petsFilterModel = PetsFilterModel.fromJson(value.data),
      emit(RequestSuccessState()),
    }).catchError((error)=>print(error.toString()));
  }

  void sendRequest({
  required String? name,
  required String? image,
  required String? year,
  required String? month,
  required String? size,
  required String? breed,
  required String? gender,
  required String? hairLength,
  required String? color,
  required String? careBehavior,
  required String? houseTrained,
  required String? description,
  required String? location,
  required String? phone,
  required String? vaccinated,
  required String? categoryId,
}) async{
    emit(Request2LoadingState());
   await DioHelper.postData(
       url: PETS,
       data: {
         'name':name,
         'image':'data:image/jpeg;base64,$image',
         'year':year,
         'month':month,
         'size':size,
         'breed':breed,
         'gender':gender,
         'hairLength':hairLength,
         'color':color,
         'careBehavior':careBehavior,
         'houseTrained':houseTrained,
         'description':description,
         'location':location,
         'phone':phone,
         'vaccinated':vaccinated,
         'categoryId':categoryId,
       },
   ).then((value) => {
     print(value.data),
     emit(Request2SuccessState()),
   }).catchError((error)=>{
     emit(Request2ErrorState()),
     print(error.toString()),
   });
  }



}