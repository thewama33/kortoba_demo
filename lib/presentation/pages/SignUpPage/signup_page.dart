import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/appStrings.dart';
import '../../../core/appTheme.dart';
import '../../../core/colors.dart';
import '../../../core/debug_prints.dart';
import '../../components/base/default_button.dart';

import '../../components/base/titled_text_formfield.dart';

class SignUpPage extends StatelessWidget {
  GlobalKey<FormState> _textFormState = GlobalKey<FormState>();
  static const routeName = "/signUpPage";
  bool obscureText = true;

  var maxSpacer = 48.verticalSpace;
  var minSpacer = 20.verticalSpace;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: kTextColor,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Form(
            key: _textFormState,
            child: RPadding(
              padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    "assets/images/applogosignup.png",
                    height: size.height * 0.18,
                    width: 250.w,
                    fit: BoxFit.contain,
                  )),
                  maxSpacer,
                  Text(
                    AppStrings.buttonSignUp,
                    style: textTheme().headline1,
                  ),
                  minSpacer,
                  Text(
                    AppStrings.signUpSubTitle,
                    style: textTheme().headline2,
                  ),
                  maxSpacer,
                  InputFieldWidget(
                    labeltext: AppStrings.userName,
                    height: 80.h,
                    width: size.width - 60,
                    controller: null,
                    lines: 1,
                    obscure: false,
                    keyboardType: TextInputType.emailAddress,
                    validation: true,
                    validationText: AppStrings.validationError,
                  ),
                  maxSpacer,
                  InputFieldWidget(
                    labeltext: AppStrings.email,
                    height: 80.h,
                    width: size.width - 60,
                    controller: null,
                    lines: 1,
                    obscure: false,
                    keyboardType: TextInputType.emailAddress,
                    validation: true,
                    validationText: AppStrings.validationError,
                  ),
                  maxSpacer,
                  InputFieldWidget(
                    labeltext: AppStrings.firstName,
                    height: 80.h,
                    width: size.width - 60,
                    controller: null,
                    lines: 1,
                    obscure: false,
                    keyboardType: TextInputType.text,
                    validation: true,
                    validationText: AppStrings.validationError,
                  ),
                  maxSpacer,
                  InputFieldWidget(
                    labeltext: AppStrings.lastName,
                    height: 80.h,
                    width: size.width - 60,
                    controller: null,
                    lines: 1,
                    obscure: false,
                    keyboardType: TextInputType.text,
                    validation: true,
                    validationText: AppStrings.validationError,
                  ),
                  maxSpacer,
                  InputFieldWidget(
                    labeltext: AppStrings.userPassword,
                    prefix: IconButton(
                      icon: Icon(
                        obscureText == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black45,
                        size: 28,
                      ),
                      onPressed: () {
                        obscureText = !obscureText;
                      },
                    ),
                    height: 80.h,
                    width: size.width - 60,
                    controller: null,
                    lines: 1,
                    obscure: obscureText,
                    keyboardType: TextInputType.text,
                    validation: true,
                    validationText: AppStrings.validationError,
                  ),
                  maxSpacer,
                  InputFieldWidget(
                    labeltext: AppStrings.confirmPasssword,
                    prefix: IconButton(
                      icon: Icon(
                        obscureText == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black45,
                        size: 28,
                      ),
                      onPressed: () {
                        obscureText = !obscureText;
                      },
                    ),
                    height: 80.h,
                    width: size.width - 60,
                    controller: null,
                    lines: 1,
                    obscure: obscureText,
                    keyboardType: TextInputType.text,
                    validation: true,
                    validationText: AppStrings.validationError,
                  ),
                  maxSpacer,
                  DefaultButton(
                    text: AppStrings.buttonSignUp,
                    onPressed: () {
                      if (_textFormState.currentState!.validate()) {}
                    },
                  ),
                  minSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: ()=> Navigator.pop(context),
                        child: Text(
                          AppStrings.buttonSignIn,
                          style: textTheme().headline1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 5.w),
                        child: Text(
                          AppStrings.alreadyHasAccount,
                          style: textTheme().headline2,
                        ),
                      ),
                    ],
                  ),
                  maxSpacer,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
