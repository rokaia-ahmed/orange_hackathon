
abstract class AdaptionState {}

class AdaptionInitial extends AdaptionState {}
class AdaptionGetDataFilterLoadingState extends AdaptionState {}
class AdaptionGetDataFilterSuccessState extends AdaptionState {}
class AdaptionGetDataFilterErrorState extends AdaptionState {
  final String error;

  AdaptionGetDataFilterErrorState(this.error);
}

class AdaptionGetDataLoginState extends AdaptionState {}
class AdaptionGetDataSuccessState extends AdaptionState {}
class AdaptionGetDataErrorState extends AdaptionState {
  final String error;

  AdaptionGetDataErrorState(this.error);
}

