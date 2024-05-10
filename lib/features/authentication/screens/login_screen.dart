 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_emotion_recognition_project/core/components/extensions.dart';
import 'package:speech_emotion_recognition_project/core/constants/dark_theme_colors.dart';
import 'package:speech_emotion_recognition_project/core/constants/light_theme_colors.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/forget_password.dart';
import 'package:speech_emotion_recognition_project/features/authentication/screens/signup_screen.dart';

import '../../../core/components/custom_btn.dart';
import '../../../modes_controller/modes_cubit.dart';
import '../controllers/login/login_cubit.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obsecurePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool appMode = AppModeCubit.get(context).isDark;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: Color(0xff0e1621),
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.deviceWidth * 0.07,
                  vertical: context.deviceHeight * 0.03),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SafeArea(
                  child: SizedBox(
                    width: context.deviceWidth,
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/app_icon.png',
                              height: context.deviceHeight * 0.15,
                              width: context.deviceWidth * 0.3,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Welcome back!' ,
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: appMode
                                      ? DarkColors.textColor
                                      : LightColors.textColor),
                            ),
                            SizedBox(
                              height: context.deviceHeight * 0.008,
                            ),
                            Text(
                              'Login to your account' ,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: appMode
                                      ? DarkColors.textColor
                                      : LightColors.textColor),
                            ),
                            SizedBox(
                              height: context.deviceHeight * 0.05,
                            ),
                            CustomTextField(
                              controller: emailController,
                              hintText: 'Enter Email' ,
                              prefixIcon: const Icon(Icons.email_outlined),
                              keyboardType: TextInputType.emailAddress,
                              validator: (email) {
                                if (email == null) {
                                  return 'this field is required!' ;
                                }
                                final bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email);
                                if (!emailValid) {
                                  return 'Enter a valid email' ;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: context.deviceHeight * 0.05,
                            ),
                            StatefulBuilder(builder: (c, setState) {
                              return CustomTextField(
                                validator: (password) {
                                  if (password == null) {
                                    return 'this field is required!' ;
                                  }

                                  if (password.length < 6) {
                                    return 'The password must not be less than 6 characters'
                                         ;
                                  } else {
                                    return null;
                                  }
                                },
                                controller: passwordController,
                                prefixIcon: const Icon(Icons.lock_outlined),
                                hintText: 'Enter Password' ,
                                obscureText: _obsecurePassword,
                                onPressedSuffixIcon: () {
                                  setState(() {
                                    _obsecurePassword = !_obsecurePassword;
                                  });
                                },
                                suffixIcon: _obsecurePassword
                                    ? const Icon(Icons.visibility_off_rounded)
                                    : const Icon(Icons.visibility),
                              );
                            }),
                            SizedBox(
                              height: context.deviceHeight * 0.005,
                            ),
                            TextButton(
                              onPressed: () => _forgotPassword((context)),
                              style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                              child: Text(
                                'Forgot your password?' ,
                                style: TextStyle(
                                  color: appMode
                                      ? DarkColors.primary
                                      : LightColors.primary,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.deviceHeight * 0.05,
                            ),
                            CustomBtn(
                              hasBackground: true,
                              onPressed: () => _login(
                                  context,
                                  emailController.text,
                                  passwordController.text),
                              textChild: 'Login' ,
                            ),
                            SizedBox(
                              height: context.deviceHeight * 0.08,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?' ,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: appMode
                                          ? DarkColors.textColor
                                          : LightColors.textColor),
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all(
                                            Colors.transparent)),
                                    onPressed: () => _signup(context),
                                    child: Text(
                                      'Sign up' ,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: appMode
                                              ? DarkColors.primary
                                              : LightColors.primary),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _login(
    BuildContext context,
    String email,
    String password,
  ) {
    if (_formKey.currentState!.validate()) {
      LoginCubit.get(context)
          .login(email: email, password: password, context: context);
    }
  }

  void _signup(BuildContext context) {
    context.push(SignUpScreen());
  }

  void _forgotPassword(BuildContext context) {
    context.push(ForgetPassword());
  }
}
