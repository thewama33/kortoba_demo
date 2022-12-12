import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/bloc/AuthsCubit/auths_cubit.dart';
import 'package:kortoba_demo/bloc/CategoryBloc/category_bloc.dart';
import 'package:kortoba_demo/bloc/ProductsBloc/products_bloc.dart';
import 'core/appRoutes.dart';
import 'core/appStrings.dart';
import 'core/appTheme.dart';
import 'presentation/components/base/bottom_nav_adv.dart';
import 'presentation/pages/CartPage/cart_page.dart';
import 'presentation/pages/CategoryPage/category_page.dart';
import 'presentation/pages/FavoritePage/favorite_page.dart';
import 'presentation/pages/HomePage/home_page.dart';
import 'presentation/pages/LoginPage/login_page.dart';
import 'presentation/pages/ProfilePage/profile_page.dart';
import 'services/local/persistence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  AppCache.instance.init().then((value) {
    runApp(ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AuthsCubit(),
                ),
                BlocProvider(
                  create: (context) => ProductsBloc(),
                ),
                BlocProvider(
                  create: (context) => CategoryBloc(),
                ),
              ],
              child: MaterialApp(
                  locale: const Locale('ar', 'EG'),
                  title: AppStrings.appTitle,
                  debugShowCheckedModeBanner: false,
                  scaffoldMessengerKey: _scaffoldKey,
                  theme: theme(),
                  routes: AppRoutes.routes,
                  initialRoute: KortobaStoreApp.routeName));
        }));
  });
}

class KortobaStoreApp extends StatelessWidget {
  const KortobaStoreApp({super.key});
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return AppCache.instance.getApiToken() == null
        ? LoginPage()
        : const MainScreen();
  }
}

class MainScreen extends StatefulWidget {
  static const routeName = "/mainScreen";

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
      bottomNavigationBar: BottomNavBarCurvedFb1(
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
          HomePage(),
          const FavoritePage(),
          CartPage(),
          CategoryPage(),
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
