
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils{

  static SharedPreferences? _sharedPreferences;
  static PreferenceUtils? _preferenceUtils;

  static Future<PreferenceUtils?> getInstance() async{

    if(_preferenceUtils == null){

      var pref = PreferenceUtils._();
      await pref._init();
      _preferenceUtils = pref;

    }

    return _preferenceUtils;
  }

  PreferenceUtils._();

  Future _init() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> setString(String key,String value) async{
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences!.setString(key, value);
  }

  static String getString(String key,{String defaultValue = ""}){
    return _sharedPreferences!.getString(key) ?? defaultValue;
  }

}