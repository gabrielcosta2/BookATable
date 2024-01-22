import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/custom_elevated_button.dart';
import 'package:book_a_table/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PSignUpScreen extends StatelessWidget {
  PSignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 26.h, vertical: 30.v),
                    child: Column(children: [
                      SizedBox(height: 25.v),
                      SizedBox(
                          height: 244.v,
                          width: 266.h,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgCapturaDeEcr,
                                    height: 190.v,
                                    width: 202.h,
                                    alignment: Alignment.topCenter),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("Book a Table!",
                                        style: theme.textTheme.displayMedium))
                              ])),
                      SizedBox(height: 49.v),
                      CampoEmail(context),
                      SizedBox(height: 25.v),
                      CampoPassword(context),
                      SizedBox(height: 25.v),
                      CampoRepetirPassword(context),
                      SizedBox(height: 25.v),
                      BotaoSignUp(context),
                      SizedBox(height: 15.v),
                      SizedBox(
                          height: 64.v,
                          width: 175.h,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                        width: 175.h,
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Já tem conta?",
                                                  style: CustomTextStyles
                                                      .bodyMedium15,
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          onTapLogin(context);
                                                        })
                                            ]),
                                            textAlign: TextAlign.center))),
                              ]))
                    ])))));
  }

  /// Email
  Widget CampoEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "Email",
        textInputType: TextInputType.emailAddress);
  }

  /// Password
  Widget CampoPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController,
        hintText: "Password",
        textInputType: TextInputType.visiblePassword,
        obscureText: true);
  }

  /// Repetir Password
  Widget CampoRepetirPassword(BuildContext context) {
    return CustomTextFormField(
        controller: passwordController1,
        hintText: "Repetir Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true);
  }

  /// Botao Signup
  Widget BotaoSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: "Sign up",
        onPressed: () {
          onTapHome(context);
        });
  }

  // Navega para o Home
  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pHome);
  }

  //Navega para o Login
  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pLogin);
  }
}
