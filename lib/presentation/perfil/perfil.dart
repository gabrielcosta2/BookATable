import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/app_bar/appbar_leading_image.dart';
import 'package:book_a_table/widgets/app_bar/appbar_title.dart';
import 'package:book_a_table/widgets/app_bar/custom_app_bar.dart';
import 'package:book_a_table/widgets/custom_elevated_button.dart';
import 'package:book_a_table/widgets/custom_text_form_field.dart';
import 'package:book_a_table/widgets/app_bar/hamburger_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// ignore_for_file: must_be_immutable
class PPerfilAdminScreen extends StatelessWidget {
  PPerfilAdminScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        key: _scaffoldKey,
        appBar: Header(context),
        drawer: Drawer(
          child: NavBar(), // Utilize o widget Sidebar aqui
        ),
        body: Form(
            key: _formKey,
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 21.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage7,
                          height: 195.v,
                          width: 333.h,
                          radius: BorderRadius.circular(10.h),
                          margin: EdgeInsets.only(left: 2.h)),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.only(left: 8.h, right: 88.h),
                          child: Row(children: [
                            Text("Perfil de Utilizador",
                                style: theme.textTheme.headlineSmall),
                            CustomImageView(
                                imagePath: ImageConstant.imgUserIconRestaurant,
                                height: 24.v,
                                width: 25.h,
                                margin: EdgeInsets.only(left: 9.h, top: 3.v))
                          ])),
                      SizedBox(height: 24.v),
                      Padding(
                          padding: EdgeInsets.only(left: 21.h),
                          child: Text("Email",
                              style: CustomTextStyles.bodyLargeOnPrimary_1
                                  .copyWith(
                                      decoration: TextDecoration.underline))),
                      SizedBox(height: 4.v),
                      Padding(
                          padding: EdgeInsets.only(left: 2.h),
                          child: CustomTextFormField(
                              controller: emailController,
                              hintText: "rotadosabores@gmail.com",
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 19.h, vertical: 20.v),
                              borderDecoration: TextFormFieldStyleHelper
                                  .fillSecondaryContainer,
                              fillColor: theme.colorScheme.secondaryContainer,
                              readOnly: true)),
                      SizedBox(height: 33.v),
                      Padding(
                          padding: EdgeInsets.only(left: 21.h),
                          child: Text("Morada",
                              style: CustomTextStyles.bodyLargeOnPrimary_1
                                  .copyWith(
                                      decoration: TextDecoration.underline))),
                      SizedBox(height: 5.v),
                      CustomElevatedButton(
                        text:
                            "Av. dos Descobrimentos, 333\n4400-103 Santa Marinha - V.N.Gaia",
                        margin: EdgeInsets.only(left: 2.h),
                        buttonTextStyle:
                            CustomTextStyles.bodyMediumSecondaryContainer_1,
                      ),
                    ]))));
  }

  /// Widget da Secção
  PreferredSizeWidget Header(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 70.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgCapturaDeEcr,
          margin: EdgeInsets.only(left: 6.h),
          onTap: () {
            onTapHome(context);
          }),
      title: AppbarTitle(
          text: "Book a Table!",
          margin: EdgeInsets.only(left: 2.h),
          onTap: () {
            onTapHome(context);
          }),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
      ],
    );
  }

  // Navegar para a página inicial
  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pHome);
  }
}
