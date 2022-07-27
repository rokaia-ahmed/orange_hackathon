import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_orange/models/filtered_animal_model.dart';
import 'package:pet_orange/models/pets_filtered_model.dart';
import '../../../shared/network/network.dart';
import 'adaption_state.dart';

class AdaptionCubit extends Cubit<AdaptionState> {
  AdaptionCubit() : super(AdaptionInitial());

  static AdaptionCubit get(context) => BlocProvider.of(context);

  PetsFilterModel? petsFilterModel;
  void getFilterData(String categoryId) {
    emit(AdaptionGetDataFilterLoadingState());
    DioHelper.getData(url: '/pets/filters/$categoryId')
        .then((value) {
      petsFilterModel = PetsFilterModel.fromJson(value.data);
          emit(AdaptionGetDataFilterSuccessState());
    }
    )
        .catchError((error) {
      emit(AdaptionGetDataFilterErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<PetsByCategoryModel> petsList =[];
  PetsByCategoryModel? petsModel;
  void getPetsList(String categoryId){
    emit(AdaptionGetDataLoginState());
    DioHelper
        .getData(url: '/categories/$categoryId/pets')
        .then((value) {
          value.data.forEach((element){
            petsList.add(PetsByCategoryModel.fromJson(element));
            emit(AdaptionGetDataSuccessState());
          });
          print(petsList);

    })
        .catchError((error){
          emit(AdaptionGetDataErrorState(error.toString()));
          print(error.toString());
    });
  }
}
