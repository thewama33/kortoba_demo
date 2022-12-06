import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/presentation/pages/LoginPage/login_page.dart';
import 'core/appStrings.dart';
import 'presentation/pages/CartPage/cart_page.dart';
import 'presentation/pages/CategoryPage/category_page.dart';
import 'presentation/pages/FavoritePage/favorite_page.dart';
import 'presentation/pages/HomePage/home_page.dart';
import 'presentation/pages/ItemPage/detailed_page.dart';
import 'presentation/pages/ProfilePage/profile_page.dart';

import 'core/appTheme.dart';

import 'presentation/components/base/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  runApp(KortobaStoreApp());
}

class KortobaStoreApp extends StatelessWidget {
  KortobaStoreApp({super.key});
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            locale: const Locale('ar', 'EG'),
            title: AppStrings.appTitle,
            debugShowCheckedModeBanner: false,
            theme: theme(),
            home: const Scaffold(
              body: MainScreen(),
            ),
          );
        });
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _controller =
      PageController(initialPage: 0, keepPage: true);

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      bottomNavigationBar: BottomNavBarRaisedInset(
          OnhomePress: () => goToPage(0),
          OnfavoritePress: () => goToPage(1),
          OnCartPress: () => goToPage(2),
          OnCategoryPress: () => goToPage(3),
          OnAccountPress: () => goToPage(4),
          badgeCount: '9'),
      body: PageView(
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LoginPage(),
          const ProductDetailPage(),
          HomePage(),
          const FavoritePage(),
          CartPage(),
          const CategoryPage(),
          const ProfilePage(),
        ],
      ),
    );
  }

  void goToPage(int page) {
    _controller.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }
}
