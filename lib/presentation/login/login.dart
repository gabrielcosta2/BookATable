import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/custom_elevated_button.dart';
import 'package:book_a_table/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class PLoginScreen extends StatelessWidget {
  PLoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                      CustomTextFormField(
                          controller: emailController,
                          hintText: "Email",
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 25.v),
                      CustomTextFormField(
                          controller: passwordController,
                          hintText: "Password",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true),
                      SizedBox(height: 35.v),
                      CustomElevatedButton(
                          text: "Login",
                          onPressed: () {
                            onTapHome(context);
                          }),
                      SizedBox(height: 15.v),
                    ])))));
  }

  // Navega para o Home
  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pHome);
  }
}
