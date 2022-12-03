extension Validators on String{
  bool get isValidEmail{

      return RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(this);
  }
  bool get emptyFieldsChecker{
    if(this.isEmpty || this==''|| this==null || !RegExp(r'^[a-z]+$').hasMatch(this)){
      return false;
    }else{
      return true;
    }
  }
}