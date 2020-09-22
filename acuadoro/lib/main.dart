import 'package:acuadoro/aquadoro.dart';
import 'package:acuadoro/goal_page.dart';
import 'package:acuadoro/pantalla_carga.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Para borrar el letrero de debug
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //
      routes: {
        //generación de pantalla principal
        'pantallaCarga': (BuildContext context) => PantallaDeCarga(),
        'goalsPage': (BuildContext context) => GoalsPage(),
        'aquadoro': (BuildContext context) => Aquadoro(),
      },
      //llamando a la ruta
      initialRoute: 'pantallaCarga',
    );
  }
}
