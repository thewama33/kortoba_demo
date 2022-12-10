import 'package:flutter/material.dart';
import 'package:kortoba_demo/main.dart';
import 'package:kortoba_demo/presentation/pages/LoginPage/login_page.dart';
import 'package:kortoba_demo/presentation/pages/SignUpPage/signup_page.dart';

import '../presentation/pages/ItemPage/detailed_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    KortobaStoreApp.routeName: ((context) =>  KortobaStoreApp()),
    MainScreen.routeName: ((context) =>  MainScreen()),
    LoginPage.routeName: ((context) => LoginPage()),
    SignUpPage.routeName: ((context) => SignUpPage()),
    ProductDetailPage.routeName:((context) => const ProductDetailPage())
  };
}
