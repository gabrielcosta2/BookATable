import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/app_bar/appbar_leading_image.dart';
import 'package:book_a_table/widgets/app_bar/appbar_title.dart';
import 'package:book_a_table/widgets/app_bar/custom_app_bar.dart';
import 'package:book_a_table/main.dart';
import 'package:book_a_table/presentation/reservas/reservas_editar.dart';
import 'package:book_a_table/widgets/app_bar/hamburger_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PReservasAdminScreen extends StatefulWidget {
  const PReservasAdminScreen({Key? key}) : super(key: key);

  @override
  State<PReservasAdminScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PReservasAdminScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String dateStr = "${today.day}-${today.month}-${today.year}";

    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(context),
      drawer: Drawer(
        child: NavBar(), // Use the Sidebar widget here
      ),
      body: Column(children: [
        Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 21.v),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgImage7,
                  height: 195.v,
                  width: 333.h,
                  radius: BorderRadius.circular(10.h),
                  margin: EdgeInsets.only(left: 1.h)),
              SizedBox(height: 5.v),
              Padding(
                  padding: EdgeInsets.only(left: 7.h, right: 87.h),
                  child: Row(children: [
                    Text("Lista de Reservas",
                        style: theme.textTheme.headlineSmall),
                    CustomImageView(
                        imagePath: ImageConstant.imgLista,
                        height: 24.v,
                        width: 25.h,
                        margin: EdgeInsets.only(left: 9.h, top: 3.v))
                  ])),
              SizedBox(height: 10.v),
              Padding(
                  padding: EdgeInsets.only(left: 7.h, right: 48.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.img_reservas,
                        height: 27.v,
                        width: 30.h),
                    Container(
                        height: 17.v,
                        width: 249.h,
                        margin: EdgeInsets.only(top: 6.v, bottom: 3.v),
                        child: Stack(alignment: Alignment.center, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Text("Mesas reservadas do Dia " + dateStr,
                                  style:
                                      CustomTextStyles.bodyMediumDeeporange800))
                        ]))
                  ])),
            ])),
        Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: rev.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  rev[index].pessoas.toString() + " Pessoa(s)"),
                              Text(rev[index].horas + " Horas"),
                              Text(rev[index].nome),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PGinaReservasEditarScreen(
                                                  r1: rev[index],
                                                )));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    rev.removeAt(index);
                                    Navigator.pushNamed(
                                        context, AppRoutes.pReservas_Admin);
                                  },
                                  icon: Icon(Icons.remove_circle))
                            ],
                          ));
                    })))
      ]),
    );
  }
}

/// Section Widget
PreferredSizeWidget Header(BuildContext context) {
  return CustomAppBar(
    leadingWidth: 70.h,
    leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgCapturaDeEcr,
        margin: EdgeInsets.only(left: 6.h),
        onTap: () {
          onTapCapturaDeEcr(context);
        }),
    title: AppbarTitle(
        text: "Book a Table!",
        margin: EdgeInsets.only(left: 2.h),
        onTap: () {
          onTapBookATable(context);
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

/// Navigates to the pGinaPrincipalScreen when the action is triggered.
onTapCapturaDeEcr(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.pHome);
}

/// Navigates to the pGinaPrincipalScreen when the action is triggered.
onTapBookATable(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.pHome);
}

/// Navigates to the pGinaMenuBurguerAbertoOneScreen when the action is triggered.
onTapMingcuteMenuFill(BuildContext context) {
  //FUNCAO PARA O  QUE FAZ QUANDO CLICA NO HAMBURGUER
  Navigator.pushNamed(context, AppRoutes.pReservas_Admin);
}
