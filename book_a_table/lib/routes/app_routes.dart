import 'package:flutter/material.dart';
import 'package:book_a_table/presentation/reservas/reservas_admin.dart';
import 'package:book_a_table/presentation/perfil/perfil.dart';
import 'package:book_a_table/presentation/login/login.dart';
import 'package:book_a_table/presentation/login/sign_up.dart';
import 'package:book_a_table/presentation/home/home.dart';
import 'package:book_a_table/presentation/reservas/reservas.dart';
import 'package:book_a_table/presentation/reservas/reservas_sucesso.dart';

class AppRoutes {
  static const String pReservas_Admin = '/reservas_admin';

  static const String pLogin = '/login';

  static const String pSign_Up = '/sign_up';

  static const String pHome = '/home';

  static const String pReservas = '/reservas';

  static const String pReserva_Sucesso = '/reserva_sucesso';

  static const String pPerfil = '/perfil';

  static Map<String, WidgetBuilder> routes = {
    pHome: (context) => PHomeScreen(),
    pReservas_Admin: (context) => PReservasAdminScreen(),
    pPerfil: (context) => PPerfilAdminScreen(),
    pLogin: (context) => PLoginScreen(),
    pSign_Up: (context) => PSignUpScreen(),
    pReservas: (context) => PReservasScreen(),
    pReserva_Sucesso: (context) => PReservaSucessoScreen(),
  };
}
