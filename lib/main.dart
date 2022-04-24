import 'package:flutter/material.dart';
import 'package:shop_app/layouts/login_layout.dart';
import 'package:shop_app/layouts/onboarding_layout.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: LoginLayout(),
    );
  }
}