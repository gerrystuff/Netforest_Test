class Utils {
   static bool email(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    var regex = RegExp(pattern as String);
    return (!regex.hasMatch(value)) ? false : true;
  }

}