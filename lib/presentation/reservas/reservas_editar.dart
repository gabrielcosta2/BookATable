// ignore_for_file: body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/app_bar/appbar_leading_image.dart';
import 'package:book_a_table/widgets/app_bar/appbar_title.dart';
import 'package:book_a_table/widgets/app_bar/custom_app_bar.dart';
import 'package:book_a_table/widgets/custom_elevated_button.dart';
import 'package:flutter/services.dart';
import 'package:book_a_table/presentation/reservas/reservas.dart';
import 'package:book_a_table/widgets/app_bar/hamburger_menu.dart';
import 'package:book_a_table/services/reservas_service.dart';

// Chave global para acesso ao ScaffoldState
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PGinaReservasEditarScreen extends StatefulWidget {
  const PGinaReservasEditarScreen({Key? key, required this.r1})
      : super(key: key);
  final reserva r1;

  @override
  State<PGinaReservasEditarScreen> createState() =>
      _MyPGinaReservasEditarScreenState();
}

class _MyPGinaReservasEditarScreenState
    extends State<PGinaReservasEditarScreen> {
  // Chave global para acesso ao formulário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectHoras = horas.first;
  TextEditingController ndePessoasController = TextEditingController();
  TextEditingController NomeController = TextEditingController();

  // Referência à coleção 'reservas' no Firestore
  final CollectionReference reservasCollection =
      FirebaseFirestore.instance.collection('reservas');

  // Função assíncrona para atualizar uma reserva no Firestore
  Future reservaUpdate(reserva rev1) async {
    return reservasCollection.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc.id == rev1.id) {
          // Atualizar informações da reserva no Firestore
          reservasCollection.doc(doc.id).update({
            "nome": NomeController.text,
            "quantidade": int.parse(ndePessoasController.text),
            "horas": selectHoras,
            "dia": Timestamp.fromDate(DateTime.now())
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obter informações sobre a mídia do dispositivo
    mediaQueryData = MediaQuery.of(context);

    // Preencher os campos com os valores atuais da reserva
    NomeController.text = widget.r1.nome;
    ndePessoasController.text = widget.r1.quantidade.toString();
    selectHoras = widget.r1.horas; //FAZ APARECER OS VALORES A EDITAR

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
                                      Text("Editar Reserva",
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
                          text: "Editar Reserva",
                          margin: EdgeInsets.only(
                              left: 86.h, right: 86.h, bottom: 23.v),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Chamar função de atualização da reserva
                              reservaUpdate(widget.r1);
                              // Navegar para a lista de reservas após editar
                              onTapLista(context);
                            }
                          }),
                    ])),
          )),
    );
  }
}

// Função que cria o widget do cabeçalho da tela
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

// Função que navega para a lista de reservas após a edição
onTapLista(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.pReservas_Admin);
}
