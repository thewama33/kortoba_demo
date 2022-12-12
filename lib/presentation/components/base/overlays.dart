import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/appTheme.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/presentation/components/base/default_button.dart';

class Overlays {
  static SnackBar snackBarCustom(
    bool isLoading,
    String msg,
    Color backcolor,
    
  ) {
    return SnackBar(
      content: ListTile(
        
        title: Text(
          msg,
          style: textTheme().headline1?.copyWith(color: Colors.white,fontFamily: "Tajawal",fontWeight: FontWeight.bold),
        ),
        leading: isLoading
            ? const CircularProgressIndicator(backgroundColor: kPrimaryColor)
            : null,
      ),
      backgroundColor: backcolor,
      duration: const Duration(seconds: 10),
      behavior: SnackBarBehavior.floating,
      padding: REdgeInsets.all(9),
    );
  }

  static Widget showDialogMessage(Widget widget) {
    return Dialog(
      child: widget
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key}) : super(key: key);
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  Widget verticalSpace = 15.verticalSpace;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 0.4.sw,
        height: 0.4.sw,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50.r,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: primaryColor,
              radius: 25.r,
              child: const CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
            verticalSpace,
             Text("Please Wait?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold)),

            // verticalSpace,
            // DefaultButton(
            //   text: "Close",
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   color: kPrimaryColor,
            // )
          ],
        ),
      ),
    );
  }
}
