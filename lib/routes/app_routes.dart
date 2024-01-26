import 'package:flutter/material.dart';
import 'package:book_a_table/presentation/reservas/reservas_admin.dart';
import 'package:book_a_table/presentation/perfil/perfil.dart';
import 'package:book_a_table/presentation/login/login.dart';
import 'package:book_a_table/presentation/home/home.dart';
import 'package:book_a_table/presentation/reservas/reservas.dart';

class AppRoutes {
  // Rotas da aplicação
  static const String pReservas_Admin =
      '/reservas_admin'; // Rota para a administração de reservas
  static const String pLogin = '/login'; // Rota para a tela de login
  static const String pHome = '/home'; // Rota para a tela inicial
  static const String pReservas = '/reservas'; // Rota para as reservas
  static const String pPerfil = '/perfil'; // Rota para o perfil do usuário

  // Mapeamento de rotas para construtores de widgets
  static Map<String, WidgetBuilder> routes = {
    pHome: (context) => PHomeScreen(),
    pReservas_Admin: (context) => PReservasAdminScreen(),
    pPerfil: (context) => PPerfilAdminScreen(),
    pLogin: (context) => PLoginScreen(),
    pReservas: (context) => PReservasScreen(),
  };
}
