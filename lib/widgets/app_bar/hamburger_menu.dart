import 'package:book_a_table/routes/app_routes.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Adjust the width as needed
      color: Color.fromARGB(
          200, 221, 161, 94), // Change the background color as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              // Handle item click
              Navigator.pushNamed(context, AppRoutes.pPerfil);
            },
          ),
          ListTile(
            leading: Icon(Icons.book_rounded),
            title: Text('Reservas'),
            onTap: () {
              // Handle item click
              Navigator.pushNamed(context, AppRoutes.pReservas_Admin);
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Ementa'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.pHome);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              //ADICIONAR LOG OUT
            },
          ),
        ],
      ),
    );
  }
}
