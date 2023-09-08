import 'package:get/get_navigation/src/root/internacionalization.dart';

class Language extends Translations {
  @override
  Map<String ,Map<String, String>> get keys => {
    'en_Us' : {
      'email_hint' : 'Email',
      'password_hint' : 'Password',
      'internetException' : 'We\'re unable to process your request \n please check your data \n connection',
      'generalException' : 'We\'re unable to process your request \n please try again',
      'login' : 'Login',
      'blank_pass' : 'Please enter password',
      'blank_email' : 'Please enter email',
    },
    'ur_PK' : {
      'emailhint' : 'گمایل۔چہم'
    }
  };
}