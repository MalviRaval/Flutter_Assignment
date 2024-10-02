class Utils{
 static final numberRegExp=RegExp(r'^\d+$');

  //static final RegExp nameRegExp = RegExp('[a-zA-Z]');

 // static final RegExp numberRegExp = RegExp(r'\d');

  static bool isValidNumber(String num)  {
    return  numberRegExp.hasMatch(num);
  }

}