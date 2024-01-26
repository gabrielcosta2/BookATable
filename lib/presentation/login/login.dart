import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/custom_elevated_button.dart';
import 'package:book_a_table/widgets/custom_text_form_field.dart';
import 'package:book_a_table/widgets/auth_service.dart';

class PLoginScreen extends StatefulWidget {
  PLoginScreen({Key? key}) : super(key: key);

  @override
  _PLoginScreenState createState() => _PLoginScreenState();
}

class _PLoginScreenState extends State<PLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 30.v),
            child: Column(
              children: [
                SizedBox(height: 25.v),
                SizedBox(
                  height: 344.v,
                  width: 266.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgCapturaDeEcr,
                        height: 250.v,
                        width: 250.h,
                        alignment: Alignment.topCenter,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Book a Table!",
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 49.v),
                CustomTextFormField(
                  controller: emailController,
                  hintText: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 25.v),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: "Password",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 35.v),
                CustomElevatedButton(
                  text: "Login",
                  onPressed: () {
                    _performLogin(context);
                  },
                ),
                SizedBox(height: 15.v),
                if (showError)
                  Text(
                    "Erro - Credenciais Erradas",
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _performLogin(BuildContext context) async {
    setState(() {
      showError = false; // Resetar estado de erro
    });

    bool isAuthenticated = await AuthService.login(
      emailController.text,
      passwordController.text,
    );

    if (isAuthenticated) {
      // Utilizar um Future.microtask para realizar a navegação após a conclusão da tarefa atual.
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, AppRoutes.pHome);
      });
    } else {
      // Lidar com falha no login
      setState(() {
        showError = true;
      });
    }
  }
}
