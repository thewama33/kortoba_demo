import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/debug_prints.dart';
import 'package:kortoba_demo/presentation/components/base/default_button.dart';
import 'package:kortoba_demo/providers/category_provider.dart';
import 'core/appStrings.dart';
import 'core/appTheme.dart';
import 'presentation/components/base/bottom_navigation.dart';
import 'presentation/pages/CartPage/cart_page.dart';
import 'presentation/pages/CategoryPage/category_page.dart';
import 'presentation/pages/FavoritePage/favorite_page.dart';
import 'presentation/pages/HomePage/home_page.dart';
import 'presentation/pages/ItemPage/detailed_page.dart';
import 'presentation/pages/LoginPage/login_page.dart';
import 'presentation/pages/ProfilePage/profile_page.dart';
import 'services/local/persistence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  AppCache.instance.init().then((value) {
    runApp(ProviderScope(
      child: KortobaStoreApp(),
    ));
  });
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
            home: Scaffold(
              body: AppCache.instance.getApiToken() == null
                  ? LoginPage()
                  : MainScreen(),
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
  void initState() {
    super.initState();
  }

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
          Container(child: Consumer(
            builder: (context, ref, child) {
              return DefaultButton(
                text: "Get Category",
                onPressed: () {
                  ref.read(categoryProvider).getCategory();
                },
              );
            },
          )),
          HomePage(),
          const ProductDetailPage(),
          const FavoritePage(),
          CategoryPage(),
          CartPage(),
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
