//Goals page
//Importar libreria material
import 'package:acuadoro/goal_card.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

//TickerPROVIDERsATATE sirve para agrgar las animaciones (doble herencia)
class _GoalsPageState extends State<GoalsPage> with TickerProviderStateMixin {
  //Para la lista de metas
  final List<GoalCard> _metas = [];

  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          centerTitle: true,
          title: _fadeText(), //IMPORTANDO EL TEXTO
          backgroundColor: Colors.cyan[600],
        ),*/
        body: Stack(
      children: [
        //Color a la pantalla
        //Container(color: Colors.cyan[600]),
        fondoMetas(),

        SafeArea(
          //para que no choque
          child: Column(
            //para los contenedores
            children: [
              _fadeText(),
              Flexible(
                  child: ListView.builder(
                itemBuilder: (_, int index) {
                  //para eliminar
                  return Dismissible(
                    key: new UniqueKey(),
                    child: _metas[index],
                    background: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(left: 10),
                      //icono
                      alignment: AlignmentDirectional.centerStart,
                      color: Colors.deepOrange[700],
                      child: Icon(Icons.delete_outline),
                    ),
                    //Por detras de la parte visible
                    onDismissed: (direccion) {
                      setState(() {
                        print(_metas[index].actividad);

                        _metas.removeAt(index);
                        print("Despues de eliminar");
                        print(_metas[index].actividad);
                      });
                    },
                  );
                }, //=> _metas[index],
                itemCount: _metas.length,
              )),
              //Boton de +
              FloatingActionButton(
                onPressed: () {
                  _agregarCard();
                },
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.cyan[50],
                  size: 50,
                ),
              ),
              //espacio al finla de la pantalla
              Container(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget fondoMetas() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Colors.cyan[600], Colors.cyan[300]])),
    );
  }

  //hacer un metodo privado
  Widget _fadeText() {
    //Para poner un espacio
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: SizedBox(
        width: 350.0,
        child: FadeAnimatedTextKit(
            //para que se repita por siempre
            repeatForever: true,
            text: [
              "¿Qué es lo realmente \nimportante?",
              "Vamos a \n hacerlo :D",
              "¿Qué has estado \n dejando pendiente?"
            ],
            textStyle: GoogleFonts.craftyGirls(
                fontSize: 25.0,
                color: Colors.blueGrey[50],
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.bottomCenter // or Alignment.topLeft
            ),
      ),
    );
  } //build

//metodo para agregar card
  void _agregarCard() {
    final animacionCards = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    GoalCard meta = new GoalCard(
      animationController: animacionCards,
    );
    //agregando a la lista
    setState(() {
      _metas.insert(_metas.length, meta);
    });
    meta.animationController.forward();
  }

  @override
  void dispose() {
    for (GoalCard meta in _metas) meta.animationController.dispose();
    super.dispose();
  }
}
