// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kortoba_demo/core/appTheme.dart';
import 'package:kortoba_demo/core/colors.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext conext) {
    return SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ));
  }
}

class BackgroundImageFb1 extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  const BackgroundImageFb1(
      {required this.child, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Place as the child widget of a scaffold
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [BoxShadow(color: Colors.grey)]),
      child: child,
    );
  }
}


class BottomNavBarRaisedInset extends StatefulWidget {
  BottomNavBarRaisedInset(
      {Key? key,
      required this.OnhomePress,
      required this.OnfavoritePress,
      required this.OnCartPress,
      required this.OnCategoryPress,
      required this.OnAccountPress,
      required this.badgeCount})
      : super(key: key);

  final Function() OnhomePress;
  final Function() OnfavoritePress;
  final Function() OnCartPress;
  final Function() OnCategoryPress;
  final Function() OnAccountPress;
  String? badgeCount;
  @override
  _BottomNavBarRaisedInsetState createState() =>
      _BottomNavBarRaisedInsetState();
}

class _BottomNavBarRaisedInsetState extends State<BottomNavBarRaisedInset> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 0.09.sh;
    const backgroundColor = Colors.transparent;
    const shadowColor = Colors.grey; //color of Navbar shadow
    double elevation = 105; //Elevation of the bottom Navbar

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height),
            painter: BottomNavCurvePainter(
                backgroundColor: backgroundColor,
                shadowColor: shadowColor,
                elevation: elevation),
          ),
          SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //TODO
                NavBarIcon(
                  icon: Icons.home,
                  onPressed: widget.OnhomePress,
                  text: "Home",
                  selected: false,
                  defaultColor: kPrimaryColor,
                ),
                NavBarIcon(
                  text: "Favorite",
                  icon: Icons.favorite,
                  selected: false,
                  onPressed: widget.OnfavoritePress,
                  defaultColor: kPrimaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 8,
                ),
                NavBarIcon(
                  text: "Category",
                  icon: Icons.category_rounded,
                  selected: false,
                  onPressed: widget.OnCategoryPress,
                  defaultColor: kPrimaryColor,
                ),
                NavBarIcon(
                  text: "Account",
                  icon: Icons.person,
                  selected: false,
                  onPressed: widget.OnAccountPress,
                  defaultColor: kPrimaryColor,
                )
              ],
            ),
          ),
          Center(
            heightFactor: 0.6,
            child: Badge(
              badgeContent: Text(
                '${widget.badgeCount}',
                style: textTheme().headline1?.copyWith(color: kPrimaryColor),
                textAlign: TextAlign.center,
              ),
              padding: REdgeInsets.all(8.r),
              badgeColor: kSecondaryColor,
              alignment: Alignment.bottomCenter,
              toAnimate: true,
              animationType: BadgeAnimationType.slide,
              animationDuration: kAnimationDuration,
              child: FloatingActionButton(
                  isExtended: true,
                  backgroundColor: kPrimaryColor,
                  elevation: 0.4,
                  onPressed: widget.OnCartPress,
                  child: const Icon(Icons.shopping_basket_rounded)),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white,
      this.insetRadius = 38,
      this.shadowColor = Colors.white,
      this.elevation = 100});

  Color backgroundColor;
  Color shadowColor;
  double elevation;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;

    path.lineTo(insetCurveBeginnningX, 0);
    path.arcToPoint(Offset(insetCurveEndX, 0),
        radius: const Radius.circular(41), clockwise: true);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawShadow(path, shadowColor, elevation, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = kSecondaryColor,
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}
