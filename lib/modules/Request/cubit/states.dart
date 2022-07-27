abstract class RequestStates {}

class RequestInitialStates extends RequestStates {}

class RequestLoadingState extends RequestStates {}
class RequestSuccessState extends RequestStates {}
class RequestErrorState extends RequestStates {}

class Request2LoadingState extends RequestStates {}
class Request2SuccessState extends RequestStates {}
class Request2ErrorState extends RequestStates {}
