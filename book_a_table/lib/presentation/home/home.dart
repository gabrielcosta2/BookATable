import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/app_bar/appbar_title.dart';
import 'package:book_a_table/widgets/app_bar/custom_app_bar.dart';
import 'package:book_a_table/widgets/custom_elevated_button.dart';
import 'package:book_a_table/widgets/app_bar/appbar_leading_image.dart';
import 'package:book_a_table/main.dart';
import 'package:book_a_table/widgets/app_bar/hamburger_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PHomeScreen extends StatelessWidget {
  const PHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(context),
      drawer: Drawer(
        child: NavBar(), // Use the Sidebar widget here
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 14.v),
            child: Column(
              children: [
                SizedBox(height: 7.v),
                ImagemRestaurante(context),
                SizedBox(height: 5.v),
                Padding(
                  padding: EdgeInsets.only(left: 9.h, right: 89.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rota dos Sabores",
                              style: theme.textTheme.headlineSmall,
                            ),
                            Container(
                              width: 173.h,
                              margin: EdgeInsets.only(right: 32.h),
                              child: Text(
                                "Horário de Funcionamento:\n12:00-15:00\n19:00-00:00",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyMediumSecondaryContainer13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgMedicalIconRestaurant,
                        height: 24.v,
                        width: 25.h,
                        margin: EdgeInsets.only(left: 9.h, top: 3.v),
                      ),
                    ],
                  ),
                ),
                Text("Menu", style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: Alimento.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Alimento[index].comida),
                        Text(Alimento[index].preco.toString() + "€"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BotaoReserva(context),
    );
  }

  PreferredSizeWidget Header(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 80.h,
      leading: Builder(
        builder: (context) => Row(
          children: [
            AppbarLeadingImage(
              imagePath: ImageConstant.imgCapturaDeEcr,
              margin: EdgeInsets.only(left: 6.h),
              onTap: () {
                onTapHome(context);
              },
            ),
            SizedBox(width: 10.0),
          ],
        ),
      ),
      title: AppbarTitle(
        text: "Book a Table!",
        margin: EdgeInsets.only(left: 2.h),
        onTap: () {
          onTapHome(context);
        },
      ),
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

  Widget ImagemRestaurante(BuildContext context) {
    return SizedBox(
      height: 195.v,
      width: 333.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage7,
            height: 195.v,
            width: 333.h,
            radius: BorderRadius.circular(10.h),
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage7,
            height: 195.v,
            width: 333.h,
            radius: BorderRadius.circular(10.h),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget BotaoReserva(BuildContext context) {
    return CustomElevatedButton(
      width: 188.h,
      text: "Fazer Reserva",
      margin: EdgeInsets.only(left: 86.h, right: 86.h, bottom: 23.v),
      onPressed: () {
        onTapReservas(context);
      },
    );
  }

  onTapReservas(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pReservas);
  }

  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pHome);
  }

  onTapReservasLista(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pReservas_Admin);
  }
}
