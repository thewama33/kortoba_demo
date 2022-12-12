import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';

import '../../../core/appTheme.dart';

class BottomNavBarCurvedFb1 extends StatefulWidget {
  BottomNavBarCurvedFb1(
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
  _BottomNavBarCurvedFb1State createState() => _BottomNavBarCurvedFb1State();
}

class _BottomNavBarCurvedFb1State extends State<BottomNavBarCurvedFb1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    final accentColor = const Color(0xffffffff);
    final backgroundColor = Colors.white;

    return BottomAppBar(
      color: Colors.transparent,
      
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
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
                  backgroundColor: kPrimaryColor,
                  elevation: 0.1,
                  onPressed: widget.OnCartPress,
                  child: const Icon(Icons.shopping_basket)),
            ),
          ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Home",
                  icon: Icons.home_outlined,
                  selected: true,
                  onPressed: widget.OnhomePress,
                  defaultColor: kSecondaryColor,
                  selectedColor: kPrimaryColor,
                ),
                NavBarIcon(
                  text: "Favorite",
                  icon: Icons.favorite,
                  selected: false,
                  onPressed: widget.OnfavoritePress,
                  defaultColor: kSecondaryColor,
                  selectedColor: kPrimaryColor,
                ),
                SizedBox(width: 56),
                NavBarIcon(
                    text: "Category",
                    icon: Icons.category,
                    selected: false,
                    onPressed: widget.OnCategoryPress,
                    defaultColor: kSecondaryColor,
                    selectedColor: kPrimaryColor),
                NavBarIcon(
                  text: "Account",
                  icon: Icons.person,
                  selected: false,
                  onPressed: widget.OnAccountPress,
                  selectedColor: kPrimaryColor,
                  defaultColor: kSecondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
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
      this.selectedColor = const Color(0xffFF8527),
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
