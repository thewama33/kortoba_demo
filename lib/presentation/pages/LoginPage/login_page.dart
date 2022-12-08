import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/end_points.dart';
import 'package:kortoba_demo/providers/login_provider.dart';

import '../../../core/appStrings.dart';
import '../../../core/appTheme.dart';
import '../../../core/debug_prints.dart';
import '../../../services/local/persistence.dart';
import '../../components/base/default_button.dart';
import '../../components/base/titled_text_formfield.dart';



class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _textFormState = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  var maxSpacer = 48.verticalSpace;
  var minSpacer = 20.verticalSpace;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    var provider = ref.read(loginProvider);
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
                  Text(
                    AppCache.instance.getApiToken() ?? 'No Token',
                    style: textTheme().headline2,
                  ),
                  maxSpacer,
                  InputFieldWidget(
                    labeltext: AppStrings.userName,
                    height: 80.h,
                    width: size.width - 60,
                    controller: usernameController,
                    lines: 1,
                    obscure: false,
                    keyboardType: TextInputType.text,
                    validationText: AppStrings.validationError,
                    onChanged: (text) {
                      usernameController.text = text;

                      printInfo(usernameController.text);
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
                        obscureText = !obscureText;
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
                      passwordController.text = text;
                      printInfo(passwordController.text);
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
                      print(usernameController.text);
                      print(passwordController.text);
                      print(Endpoints.POST_LOGIN_API);

                      provider.requestLogin(
                          usernameController.text, passwordController.text);
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
