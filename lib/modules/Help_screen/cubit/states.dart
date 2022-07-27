abstract class HelpStates {}
class HelpInitialStates extends HelpStates {}

class HelpLoadingState extends HelpStates {}
class HelpSuccessState extends HelpStates {}
class HelpErrorState extends HelpStates {
  String? error ;
  HelpErrorState(this.error);
}
