import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/shared/utils/constants.dart';

class SharedPreferencesHelper {

  /* SINGLETON */
  /*static final SharedPreferencesHelper _instance = SharedPreferencesHelper.getInstance();

  factory SharedPreferencesHelper() => _instance;

  static late SharedPreferences sharedPreferences;

  SharedPreferencesHelper.getInstance() {
    init();
  }

  static void init() async
  {
      sharedPreferences = await SharedPreferences.getInstance();
  }
  */

  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences =  await SharedPreferences.getInstance();
  }

  static bool isUserSigned(){
      return sharedPreferences.getBool(Constants.SIGN_IN_KEY)?? false;
  }

  static Future<bool> setUserStatus(
      {
        required bool status }) async
  {
    return await sharedPreferences.setBool(Constants.SIGN_IN_KEY, status);
  }

}