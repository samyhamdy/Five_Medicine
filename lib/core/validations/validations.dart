import 'package:os_project/core/resources/app_strings.dart';

class AppValidations {
  static bool emailRegExp(email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  static emailValidation(String email) => email.isEmpty
      ? AppStrings.pleaseEnterEmail
      : !emailRegExp(email)
          ? AppStrings.pleaseEnterValidEmail
          : null;
  static nameValidation(String name) => name.isEmpty
      ? AppStrings.pleaseEnterName
      : name.length < 5
          ? AppStrings.nameishort
          : (name.split(" ").length < 2)
              ? AppStrings.twowords
              : (name.split(" ")[1].length < 2)
                  ? AppStrings.twowords
                  : !RegExp(r"^[a-zA-Z0-9-\u0621-\u064A0]").hasMatch(name)
                      ? AppStrings.pleaseEnterVALIDName
                      : null;

  static phoneValidation(String phone) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (phone.isEmpty) {
      return AppStrings.pleaseEnterphone;
    } else if (!regExp.hasMatch(phone)) {
      return AppStrings.pleaseEntervalidphone;
    }
  }
}
