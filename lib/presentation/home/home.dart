import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';
import 'package:book_a_table/widgets/app_bar/appbar_title.dart';
import 'package:book_a_table/widgets/app_bar/custom_app_bar.dart';
import 'package:book_a_table/widgets/custom_elevated_button.dart';
import 'package:book_a_table/widgets/app_bar/appbar_leading_image.dart';
import 'package:book_a_table/main.dart';
import 'package:book_a_table/widgets/app_bar/hamburger_menu.dart';
import 'package:book_a_table/widgets/auth_service.dart';

// Definir uma chave global para o estado da estrutura
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class PHomeScreen extends StatelessWidget {
  const PHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obter os dados da consulta de media para design responsivo
    mediaQueryData = MediaQuery.of(context);

    // Utilizar o FutureBuilder para verificar assincronamente o estado de autenticação
    return FutureBuilder<bool>(
      future: AuthService.checkAuthState(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // A verificação de autenticação está concluída
          bool isAuthenticated = snapshot.data ?? false;

          if (!isAuthenticated) {
            // O utilizador não está autenticado, navegar de volta para a tela de login
            Navigator.pushReplacementNamed(context, AppRoutes.pLogin);
            return Container(); // Devolver um contentor vazio para evitar mais renderizações
          }

          // O utilizador está autenticado, continuar com o código da tela inicial
          return Scaffold(
            key: _scaffoldKey,
            appBar:
                Header(context), // Widget de barra de aplicação personalizado
            drawer: Drawer(
              child: NavBar(), // Widget de navegação lateral personalizado
            ),
            body: Column(
              children: [
                // Detalhes e imagem do restaurante
                Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 14.v),
                  child: Column(
                    children: [
                      SizedBox(height: 7.v),
                      ImagemRestaurante(
                          context), // Widget de imagem do restaurante
                      SizedBox(height: 5.v),
                      // Detalhes do restaurante
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
                              // Widget de imagem personalizado
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
                // Lista de itens de comida
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
            // Barra de navegação inferior
            bottomNavigationBar: BotaoReserva(context),
          );
        } else {
          // Mostrar indicador de carregamento ou algo mais enquanto verifica o estado de autenticação
          return CircularProgressIndicator();
        }
      },
    );
  }

  // Widget de barra de aplicação personalizado
  PreferredSizeWidget Header(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 80.h,
      leading: Builder(
        builder: (context) => Row(
          children: [
            // Imagem principal na barra de aplicação
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
        // Ícone do menu de hambúrguer
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

  // Widget para exibir a imagem do restaurante
  Widget ImagemRestaurante(BuildContext context) {
    return SizedBox(
      height: 195.v,
      width: 333.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Duas imagens sobrepostas para criar um efeito visual
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

  // Widget para o botão "Fazer Reserva"
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

  // Método de navegação para o botão "Fazer Reserva"
  onTapReservas(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pReservas);
  }

  // Método de navegação para a ação "Home" na barra de aplicação
  onTapHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pHome);
  }

  // Método de navegação para uma lista de reservas específica
  onTapReservasLista(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pReservas_Admin);
  }
}
