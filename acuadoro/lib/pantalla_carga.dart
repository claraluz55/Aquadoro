import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:acuadoro/goal_page.dart';

class PantallaDeCarga extends StatefulWidget {
  @override
  _PantallaDeCargaState createState() => _PantallaDeCargaState();
}

class _PantallaDeCargaState extends State<PantallaDeCarga> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: GoalsPage(),
      title: Text(
        'Acuadoro',
        style: GoogleFonts.mansalva(
            fontWeight: FontWeight.bold,
            fontSize: 60,
            color: Colors.blueGrey[50]),
      ),
      //agregar imagen
      image: Image.asset('assets/Acuadoro.png'),
      photoSize: 120.0,
      backgroundColor: Colors.blueAccent,
    );
  }
}
