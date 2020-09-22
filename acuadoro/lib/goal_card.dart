import 'package:acuadoro/aquadoro.dart';
import 'package:flutter/material.dart';

class GoalCard extends StatefulWidget {
  GoalCard({
    this.animationController,
  });

  @override
  _GoalCardState createState() => _GoalCardState();

  //atributos
  String actividad;
  int tConcentracion;
  int tDescanso;

  final AnimationController animationController;
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    //Para conocer el ancho de pantalla
    double anchoPantalla = MediaQuery.of(context).size.width;
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: widget.animationController, curve: Curves.linear),
      axisAlignment: 0.0,
      child: Center(
        child: Container(
          //separacion
          margin: EdgeInsets.all(10),
          //width: anchoPantalla * 0.9,
          decoration: BoxDecoration(
            color: Color.fromRGBO(223, 255, 255, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Actividad
              Container(
                //margen interior
                padding: EdgeInsets.only(left: 10, bottom: 13),
                //llamando a la accion
                child: _actividadInput(),
                width: anchoPantalla * 0.45,
              ),
              Spacer(),
              //Concentracion
              //separacion
              Spacer(),
              Container(
                //llamando a la accion
                child: _inputConcentracion(),
                width: anchoPantalla * 0.15,
              ),
              //Actividad
              Spacer(),
              Container(
                //llamando a la accion
                child: _inputDescanso(),
                width: anchoPantalla * 0.15,
              ),
              Spacer(),
              Container(
                width: anchoPantalla * 0.13,
                child: FlatButton(
                    //Cuando se presione
                    onPressed: () {
                      print('Navegando');
                      //Validando que los campos esten completados
                      if ((widget.actividad != null) &&
                          (widget.tConcentracion != null) &&
                          (widget.tDescanso != null)) {
                        //En caso de que no haya campos nulos
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Aquadoro(
                                  //Mandando argumentos
                                  actividad: widget.actividad,
                                  tConcentracion: widget.tConcentracion,
                                  tDescanso: widget.tDescanso,
                                )));
                      } else {
                        //No hace nada si hay campos nulos
                      }
                    },
                    //icono de la flecha
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: anchoPantalla * 0.1,
                      color: Colors.cyan[700],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  } //build

//para que no se pierdan las tarjetas anteriores

  String initialActivity() {
    if (widget.actividad == null) {
      return " ";
    } else {
      //cuando ya se definio se guarda la cadena
      return "${widget.actividad.toString()}";
    }
  }

  String initialConcentracion() {
    if (widget.tConcentracion == null) {
      return " ";
    } else {
      return "${widget.tConcentracion.toString()}";
    }
  }

  String initialDescanso() {
    if (widget.tDescanso == null) {
      return " ";
    } else {
      return "${widget.tDescanso.toString()}";
    }
  }

//Actividad
  Widget _actividadInput() {
    //Formato
    return TextFormField(
      initialValue: initialActivity(),
      decoration: InputDecoration(
        labelText: "Actividad",
        labelStyle: TextStyle(fontSize: 13),
      ),
      //Cuando haya un cambio
      onChanged: (activity) {
        widget.actividad = activity;
        print("la actividad es ${widget.actividad}");
      },
    );
  } //actividad

//Concentracion
  Widget _inputConcentracion() {
    return TextFormField(
      initialValue: initialConcentracion(),
      //para el teclado numerico
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Focus",
        labelStyle: TextStyle(fontSize: 13),
      ),
      //Cuando haya un cambio
      onChanged: (tiempoConcentracion) {
        widget.tConcentracion = (double.parse(tiempoConcentracion)).toInt();
        print("tConcentracion es = ${widget.tConcentracion}");
      },
    );
  }
  //Concentracion

//Descanso
  Widget _inputDescanso() {
    return TextFormField(
      initialValue: initialDescanso(),
      //para el teclado numerico
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Relax",
        labelStyle: TextStyle(fontSize: 13),
      ),
      //Cuando haya un cambio
      onChanged: (tiempoDescanso) {
        widget.tDescanso = (double.parse(tiempoDescanso)).toInt();
        print("tDescanso es = ${widget.tDescanso}");
      },
    );
  }
  //Descanso
}
