import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/app_bar/appbar_leading_image.dart';
import 'package:book_a_table/widgets/app_bar/appbar_title.dart';
import 'package:book_a_table/widgets/app_bar/custom_app_bar.dart';
import 'package:book_a_table/presentation/reservas/reservas_editar.dart';
import 'package:book_a_table/widgets/app_bar/hamburger_menu.dart';
import 'package:book_a_table/services/reservas_service.dart';

// Chave global para acesso ao ScaffoldState
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PReservasAdminScreen extends StatefulWidget {
  const PReservasAdminScreen({Key? key}) : super(key: key);

  @override
  State<PReservasAdminScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PReservasAdminScreen> {
  // Referência à coleção 'reservas' no Firestore
  final CollectionReference reservasCollection =
      FirebaseFirestore.instance.collection('reservas');

  // Serviço para manipulação de reservas
  final ReservasService _reservaservice = ReservasService();

  // Função assíncrona para remover uma reserva do Firestore
  Future reservaRemove(reserva rev1) async {
    return reservasCollection.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc.id == rev1.id) {
          reservasCollection.doc(doc.id).delete();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obter a data atual
    DateTime today = DateTime.now();
    String dateStr = "${today.day}-${today.month}-${today.year}";

    // Obter informações sobre a mídia do dispositivo
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: Header(context),
      drawer: Drawer(
        child: NavBar(),
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
          child: StreamBuilder<List<reserva>>(
              stream: _reservaservice.getReservas(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Sem Reservas'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      reserva reserva1 = snapshot.data![index];
                      return Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(reserva1.quantidade.toString() +
                                  " Pessoa(s)"),
                              Text(reserva1.horas +
                                  " ${reserva1.dia.day}/${reserva1.dia.month}/${reserva1.dia.year}"),
                              Text(reserva1.nome),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PGinaReservasEditarScreen(
                                                  r1: reserva1,
                                                )));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    reservaRemove(reserva1);
                                    Navigator.pushNamed(
                                        context, AppRoutes.pReservas_Admin);
                                  },
                                  icon: Icon(Icons.remove_circle))
                            ],
                          ));
                    },
                  );
                }
              }),
        ))
      ]),
    );
  }
}

// Função que retorna o widget AppBar personalizado
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

// Função que navega para a tela inicial
onTapCapturaDeEcr(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.pHome);
}

// Função que navega para a tela inicial
onTapBookATable(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.pHome);
}

// Função que navega para a tela de reservas no menu
onTapMingcuteMenuFill(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.pReservas_Admin);
}
