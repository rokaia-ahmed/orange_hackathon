class SignUpModel{
  String?accessToken ;
  SignUpModel.fromJson(Map<String,dynamic>json){
    accessToken =json['accessToken'];
  }
}