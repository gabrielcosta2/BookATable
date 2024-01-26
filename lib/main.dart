import 'package:book_a_table/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:book_a_table/theme/theme_helper.dart';
import 'package:book_a_table/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ThemeHelper().changeTheme('primary');
  runApp(BookTable());
}

class BookTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Book a Table!',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.pLogin, //Seleciona onde é o HOME
      routes: AppRoutes.routes,
    );
  }
}

class login {
  String email;
  String password;
  login({required this.email, required this.password});
}

List<login> Login = [
  login(email: 'rotadosabores@gmail.com', password: '12345')
];

class menu {
  String comida;
  double preco;
  menu({required this.comida, required this.preco});
}

//Lista do Menu
List<menu> Alimento = [
  menu(comida: 'Ameijoas à Bulhão Pato', preco: 10),
  menu(comida: 'Burrata c/ Tomate Confit e Pesto', preco: 6),
  menu(comida: 'Carne Sichuan c/ Laranja e Cogumelos', preco: 25),
  menu(comida: 'Bife Wellington', preco: 30),
  menu(comida: 'Pescada c/ Topping de Avelãs e Esparregado', preco: 22),
  menu(comida: 'Polvo á Lagareiro', preco: 25),
  menu(comida: 'Ratatouille', preco: 20),
  menu(comida: 'Risoto de Cogumelos', preco: 25),
  menu(comida: 'Bolo de Laranja', preco: 3),
  menu(comida: 'Panna Cotta', preco: 7.5),
  menu(comida: 'Sumo do Dia', preco: 2),
  menu(comida: 'Sangria (Caneca)', preco: 20)
];
