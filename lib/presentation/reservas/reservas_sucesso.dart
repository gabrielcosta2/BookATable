import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/app_bar/appbar_leading_image.dart';
import 'package:book_a_table/widgets/app_bar/appbar_title.dart';
import 'package:book_a_table/widgets/app_bar/custom_app_bar.dart';
import 'package:book_a_table/widgets/app_bar/hamburger_menu.dart';
import 'package:book_a_table/services/reservas_service.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PReservaSucessoScreen extends StatefulWidget {
  const PReservaSucessoScreen({Key? key, required this.r1}) : super(key: key);
  final reserva r1;

  @override
  State<PReservaSucessoScreen> createState() => _PReservaSucessoScreenState();
}

class _PReservaSucessoScreenState extends State<PReservaSucessoScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    DateTime today = DateTime.now();
    String dateStr = "${today.day}-${today.month}-${today.year}";

    return Scaffold(
        key: _scaffoldKey,
        appBar: Header(context),
        drawer: Drawer(
          child: NavBar(),
        ),
        body: Container(
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
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text("Reserva Guardada",
                                  style: theme.textTheme.headlineSmall),
                              Container(
                                  width: 173.h,
                                  margin: EdgeInsets.only(right: 32.h),
                                  child: Text(
                                      "Horário de Funcionamento:\n12:00-15:00\n19:00-00:00",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles
                                          .bodyMediumSecondaryContainer13))
                            ])),
                        CustomImageView(
                            imagePath: ImageConstant.imgMedicalIconRestaurant,
                            height: 24.v,
                            width: 25.h,
                            margin: EdgeInsets.only(
                                left: 9.h, top: 3.v, bottom: 45.v))
                      ])),
              SizedBox(height: 10.v),
              CustomImageView(
                  imagePath: ImageConstant.imgGroupDeepOrange800,
                  height: 125.adaptSize,
                  width: 125.adaptSize,
                  alignment: Alignment.center),
              SizedBox(height: 15.v),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 199.h,
                      child: Text("Mesa Reservada!",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall))),
              SizedBox(height: 19.v),
              Container(
                  width: 235.h,
                  margin: EdgeInsets.only(left: 7.h, right: 92.h),
                  child: Text(
                      "Detalhes:\nDia " +
                          dateStr +
                          "\nMorada do Restaurante:\nAv. dos Descobrimentos, 333\n4400-103 Santa Marinha - V.N.Gaia\nMesa para " +
                          widget.r1.quantidade.toString() +
                          " Pessoa(s)\nHoras: " +
                          widget.r1.horas +
                          "\nNome: " +
                          widget.r1.nome,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumLightgreen800)),
              SizedBox(height: 6.v)
            ])));
  }

  /// Widget da barra de navegação personalizada.
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

  /// Navega para a tela principal ao tocar na imagem.
  onTapCapturaDeEcr(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pHome);
  }

  /// Navega para a tela principal ao tocar no título.
  onTapBookATable(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pHome);
  }

  /// Navega para a tela de reservas ao tocar no ícone do menu.
  onTapMingcuteMenuFill(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pReservas_Admin);
  }
}
