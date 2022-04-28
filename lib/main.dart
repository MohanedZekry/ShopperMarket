import 'package:flutter/material.dart';
import 'package:shop_app/layouts/home/home_layout.dart';
import 'package:shop_app/layouts/login/login_layout.dart';
import 'package:shop_app/layouts/onboarding/onboarding_layout.dart';
import 'package:shop_app/shared/helper/shared_preferences_helper.dart';
import 'package:shop_app/shared/network/remote/dio/dio_helper.dart';
import 'package:shop_app/shared/network/remote/dio/dio_shop_helper.dart';
import 'package:shop_app/shared/styles/theme/theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  DioShopHelper.init();
  await SharedPreferencesHelper.init();
  bool onBoarding = SharedPreferencesHelper.isUserSigned();

  runApp(MyApp(onBoarding: onBoarding,));
}

class MyApp extends StatelessWidget {

  final bool onBoarding;

  const MyApp({
    Key? key,
    required this.onBoarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: onBoarding? HomeLayout() : OnBoardingLayout(),
    );
  }
}