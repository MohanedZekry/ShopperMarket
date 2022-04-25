import 'package:flutter/material.dart';
import 'package:shop_app/layouts/login_layout.dart';
import 'package:shop_app/layouts/onboarding_layout.dart';
import 'package:shop_app/shared/helper/shared_preferences_helper.dart';
import 'package:shop_app/shared/network/remote/dio/dio_helper.dart';
import 'package:shop_app/shared/styles/theme/theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

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
      home: onBoarding? LoginLayout() : OnBoardingLayout(),
    );
  }
}