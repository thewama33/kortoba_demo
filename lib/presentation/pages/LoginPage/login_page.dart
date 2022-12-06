import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/appStrings.dart';
import '../../../core/appTheme.dart';
import '../../../models/LoginModel/login_model.dart';
import '../../components/base/default_button.dart';

import '../../components/base/titled_text_formfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  GlobalKey<FormState> _textFormState = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  LoginModel? model;
  var maxSpacer = 48.verticalSpace;
  var minSpacer = 20.verticalSpace;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Form(
            key: _textFormState,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    "assets/images/applogo.png",
                    height: size.height * 0.18,
                    width: 250.w,
                    fit: BoxFit.contain,
                  )),
                  maxSpacer,
                  Text(
                    AppStrings.signInTitle,
                    style: textTheme().headline1,
                  ),
                  minSpacer,
                  Text(
                    AppStrings.signInSubTitle,
                    style: textTheme().headline2,
                  ),
                  maxSpacer,
                  InputFieldWidget(
                    
                    labeltext: AppStrings.userName,
                    
                    height: 80.h,
                    width: size.width - 60,
                    controller: emailController,
                    lines: 1,
                    obscure: false,
                    keyboardType: TextInputType.text,
                    validationText: AppStrings.validationError,
                    onChanged: (text) {
                      setState(() {
                        model?.username = text;
                        print(model?.username);
                        print(text);
                      });
                    },
                  ),
                  minSpacer,
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
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    height: 80.h,
                    width: size.width - 60,
                    controller: passwordController,
                    lines: 1,
                    obscure: obscureText,
                    keyboardType: TextInputType.text,
                    validationText: AppStrings.validationError,
                    onChanged: (text) {
                      setState(() {
                        model?.password = text;
                        print(model?.password);
                      });
                    },
                  ),
                  minSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.buttonSignUp,
                          style: textTheme().headline1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 5.w),
                        child: Text(
                          AppStrings.forgetPasswordTtile,
                          style: textTheme().headline2,
                        ),
                      ),
                    ],
                  ),
                  maxSpacer,
                  DefaultButton(
                    text: AppStrings.buttonSignIn,
                    onPressed: () {
                      if (_textFormState.currentState!.validate()) {
                        print(model);
                      }
                    },
                  ),
                  minSpacer,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
