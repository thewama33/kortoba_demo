import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kortoba_demo/core/colors.dart';
import 'package:kortoba_demo/main.dart';
import 'package:kortoba_demo/presentation/pages/SignUpPage/signup_page.dart';
import '../../../bloc/AuthsCubit/auths_cubit.dart';
import '../../../core/appStrings.dart';
import '../../../core/appTheme.dart';
import '../../components/base/default_button.dart';
import '../../components/base/overlays.dart';
import '../../components/base/titled_text_formfield.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/loginPage";
  final GlobalKey<FormState> _textFormState = GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

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
                    controller: usernameController,
                    lines: 1,
                    obscure: false,
                    keyboardType: TextInputType.emailAddress,
                    validation: true,
                    validationText: AppStrings.validationError,
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
                  ),
                  minSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, SignUpPage.routeName),
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
                  BlocConsumer<AuthsCubit, AuthsState>(
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, MainScreen.routeName, (route) => false);
                      }
                      if (state is LoginFailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            Overlays.snackBarCustom(false,
                                state.errorMessage, Colors.redAccent));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return CircularProgressIndicator();
                      }

                      return DefaultButton(
                        text: AppStrings.buttonSignIn,
                        onPressed: () {
                          context.read<AuthsCubit>().requestLogin(
                              usernameController.text, passwordController.text);
                        },
                      );
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
