class LoginModel{
  String?accessToken ;
  LoginModel.fromJson(Map<String,dynamic>json){
    accessToken =json['accessToken'];
  }
}