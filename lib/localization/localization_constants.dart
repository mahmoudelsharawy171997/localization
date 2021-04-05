import 'package:flutter/cupertino.dart';
import 'package:localization/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';


const String LANGUAGE_CODE='languageCode';

const String English ='en';
const String Arabic ='ar';



Future<Locale> setLocale(String languageCode)async{
  SharedPreferences _prefs=await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE,languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale()async{
  SharedPreferences _prefs=await SharedPreferences.getInstance();
  String languageCode=_prefs.getString(LANGUAGE_CODE)?? English;
  return _locale(languageCode);
}

Locale _locale(String languageCode){
  switch (languageCode) {
    case English:
      return Locale(English, 'US');
    case Arabic:
      return Locale(Arabic, 'EG');
    default:
      return Locale(English, 'US');
  }
}

String getTranslated(BuildContext context,String key){
  return DemoLocalization.of(context).translate(key);
}