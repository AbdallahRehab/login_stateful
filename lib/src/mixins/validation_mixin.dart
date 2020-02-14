class ValidationMixin{
  String validateEmail (String value){
    if(!value.contains('@')){
      return 'please enter a valid email';
    }
    return null;
  }
  String validatePassword (String value){
    if(value.length<4){
      return 'password must be a least 4 character';
    }
    return null;
  }
}