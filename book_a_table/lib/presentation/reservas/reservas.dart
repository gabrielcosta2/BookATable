// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/app_bar/appbar_leading_image.dart';
import 'package:book_a_table/widgets/app_bar/appbar_title.dart';
import 'package:book_a_table/widgets/app_bar/custom_app_bar.dart';
import 'package:book_a_table/widgets/custom_elevated_button.dart';
import 'package:book_a_table/main.dart';
import 'package:flutter/services.dart';
import 'package:book_a_table/widgets/app_bar/hamburger_menu.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PReservasScreen extends StatefulWidget {
  const PReservasScreen({Key? key}) : super(key: key);

  @override
  State<PReservasScreen> createState() => _MyPGinaReservasScreenState();
}

class _MyPGinaReservasScreenState extends State<PReservasScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectHoras = horas.first;
  TextEditingController ndePessoasController = TextEditingController();
  TextEditingController NomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(context),
      drawer: Drawer(
        child: NavBar(), // Use the Sidebar widget here
      ),
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 11.h, vertical: 21.v),
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage7,
                          height: 195.v,
                          width: 333.h,
                          radius: BorderRadius.circular(10.h),
                          margin: EdgeInsets.only(left: 3.h)),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h, right: 89.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      Text("Criar Reserva",
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
                                    imagePath:
                                        ImageConstant.imgMedicalIconRestaurant,
                                    height: 24.v,
                                    width: 25.h,
                                    margin:
                                        EdgeInsets.only(left: 9.h, top: 3.v))
                              ])),
                      SizedBox(height: 11.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("Quantas Pessoas?",
                              style: CustomTextStyles.titleLargeLightgreen800)),
                      SizedBox(height: 9.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h, right: 21.h),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: ndePessoasController,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Erro - Insira o número de pessoas";
                              }
                            },
                          )),
                      SizedBox(height: 22.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("A que Horas?",
                              style: CustomTextStyles.titleLargeLightgreen800)),
                      SizedBox(height: 9.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h, right: 21.h),
                          child: DropdownButton(
                            value: selectHoras,
                            items: horas
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                selectHoras = value!;
                              });
                            },
                          )),
                      SizedBox(height: 22.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Text("Em que Nome?",
                              style: CustomTextStyles.titleLargeLightgreen800)),
                      SizedBox(height: 9.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h, right: 21.h),
                          child: TextFormField(
                            controller: NomeController,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Erro - Insira um nome";
                              }
                            },
                          )),
                      SizedBox(height: 22.v),
                      CustomElevatedButton(
                          width: 188.h,
                          text: "Reservar",
                          margin: EdgeInsets.only(
                              left: 86.h, right: 86.h, bottom: 23.v),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              rev.add(reserva(
                                  nome: NomeController.text,
                                  horas: selectHoras,
                                  pessoas:
                                      int.parse(ndePessoasController.text)));
                              onTapLetsBook(context);
                            }
                          }),
                    ])),
          )),
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

/// Navigates to the pGinaMesaReservadaComSucessoScreen when the action is triggered.
onTapLetsBook(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.pReserva_Sucesso);
}

onTapMingcuteMenuFill(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.pReservas_Admin);
  //FUNCAO PARA O  QUE FAZ QUANDO CLICA NO HAMBURGUER
}

List<String> horas = <String>[
  "12:00",
  "13:00",
  "14:00",
  "19:00",
  "20:00",
  "21:00",
  "22:00"
];
