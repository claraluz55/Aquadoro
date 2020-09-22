import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:flare_flutter/flare_actor.dart';

class Aquadoro extends StatefulWidget {
  //metodo constructor
  Aquadoro({
    this.actividad,
    this.tConcentracion,
    this.tDescanso,
  });

  final String actividad;
  final int tConcentracion;
  final int tDescanso;

  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  String tipoActividad = 'Focus';
  String tiempoPantalla;
  int contador = 3;

  bool kindActivity = false;

  //Variables para la funcionalidad

  int startState = 1;
  int tConcentracionSeg = 0;
  int tDescansoSeg = 0;

  bool revisarTiempoCon = false;
  bool revisarTiempoDes = false;

//variales que sirven para desactivar los botones
  bool botonDeshabilitado = false;
  bool resetDeshabilitado = false;

  String animacionActual = 'Reset';

  @override
  //El tiempo agregado se muestre en el texto
  void initState() {
    //
    super.initState();
    tiempoPantalla = '${widget.tConcentracion.toString()}:00';
    resetDeshabilitado = true; //para deshabilitar el boton
  }

  @override
  Widget build(BuildContext context) {
    //ancho de la pantalla
    double ancho = MediaQuery.of(context).size.width;
    //pantalla
    return Scaffold(
      body: Stack(
        children: [
          //Color a la pantalla
          fondoPomodoro(),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  _nuestroAppBar(context),
                  SizedBox(height: 40),
                  _contadorAcuadoro(),
                  //Agregar como un caja en l aprte superior
                  SizedBox(
                    height: 20,
                  ),
                  _aquadoroStack(ancho),
                  Expanded(child: Container()),
                  _botones(),
                  Expanded(child: Container())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fondoPomodoro() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Colors.cyan[400], Colors.cyan[800]])),
    );
  }

  Widget _nuestroAppBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 50,
          child: FlatButton(
            padding: EdgeInsets.only(right: 10, top: 10),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Colors.cyan[100],
            ),
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            widget.actividad,
            style: GoogleFonts.craftyGirls(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.cyan[50]),
          ),
        ))
      ],
    );
  }

  Widget _contadorAcuadoro() {
    switch (contador) {
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            )
          ],
        );
        break;

      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;

      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;

      case 4:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;
      case 5:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
          ],
        );
        break;
      //0 o mas de 5
      default:
        return Container(height: 45);
    }
  }

  //imagen del acaudoro
  Widget _aquadoroStack(double ancho) {
    return Stack(
      children: <Widget>[
        /*Container(
          width: 357,
          height: 357,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage('assets/Acuadoro.png'), fit: BoxFit.cover),
          ),
        ),*/
        Container(
          width: 400,
          height: 400,
          child: FlareActor(
            'assets/Aquadoroo.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: animacionActual,
          ),
        ),
        Positioned(
          top: 160,
          //tTexto respecto a la imagen
          left: ancho * 0.25,
          child: Container(
            height: 100,
            width: 170,
            //para colocar un texto debajo de otro
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    tipoActividad,
                    style: GoogleFonts.craftyGirls(
                        fontSize: 25, color: Colors.blueGrey[50]),
                  ),
                ),
                Center(
                  child: Text(
                    tiempoPantalla,
                    style: GoogleFonts.craftyGirls(
                        fontSize: 25, color: Colors.blueGrey[50]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //botones
  Widget _botones() {
    return Row(
      //espacio entre botones
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AbsorbPointer(
          //Desabilita todo lo que esta dentro de el
          absorbing: resetDeshabilitado,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.cyan[200],
              child: Row(
                children: <Widget>[
                  Text(
                    'Reset',
                    style: GoogleFonts.craftyGirls(
                        fontSize: 25, color: Colors.teal[900]),
                  ),
                  Icon(
                    Icons.rotate_left,
                    size: 25,
                    color: Colors.teal[900],
                  ),
                ],
              ),
              onPressed: () {
                animacionActual = 'Reset';
                if (tConcentracionSeg > 1) {
                  //See presiono el boton
                  revisarTiempoCon = true;
                  startState = 1;
                  print('Le diste en reset de focus');
                } else if (tDescansoSeg > 1) {
                  //tiempo relax
                  revisarTiempoDes = true;
                  //El boton de reset fue presionado miestras el tiempo de relax estaba corriendo
                  startState = 1;
                  kindActivity = false;
                  tipoActividad = 'Focus';
                  tiempoPantalla = '${widget.tConcentracion.toString()}:00';
                  print('Le diste en reset de relax y te regresa a focus');
                }
              }),
        ),
        AbsorbPointer(
          absorbing: botonDeshabilitado,
          child: OutlineButton(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue[900], style: BorderStyle.solid),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: <Widget>[
                  Text(
                    tipoActividad,
                    style: GoogleFonts.craftyGirls(
                        fontSize: 25, color: Colors.indigo[800]),
                  ),
                  Icon(
                    (kindActivity) ? Icons.adjust : Icons.album,
                    size: 25,
                    color: Colors.blue[900],
                  )
                ],
              ),
              onPressed: () {
                switch (startState) {
                  case 1:
                    //Tiempo de Focus
                    {
                      //caundo sd encuntra en este caso de deshabilitara el zoom
                      //cuando el tiempo este corriendo
                      setState(() {
                        botonDeshabilitado = true;
                        resetDeshabilitado = false;
                        animacionActual = 'LoopFocus';
                      });

                      tConcentracionSeg = (widget.tConcentracion * 60);
                      Timer.periodic(Duration(seconds: 1), (t) {
                        setState(() {
                          if (tConcentracionSeg < 1 ||
                              revisarTiempoCon == true) {
                            t.cancel();
                            revisarTiempoCon = false;
                            tiempoPantalla =
                                '${widget.tConcentracion.toString()}:00';
                            botonDeshabilitado = false;
                            resetDeshabilitado = true;

                            if (tConcentracionSeg < 1) {
                              startState = 2;
                              tipoActividad = "Relax";
                              kindActivity = true;
                              tiempoPantalla =
                                  '${widget.tDescanso.toString()}:00';
                              //cuando el contador etenga 4 y se haya realizado el ultimo ciclo muestre la aleta
                              if (contador == 4) {
                                _mostrarAlerta(context);
                                contador = 5;
                                tiempoPantalla = '${30}:00';
                              } else {
                                //mostrar cilo de relax
                                tiempoPantalla = '${widget.tDescanso}:00';
                              }
                            }
                          } else if (tConcentracionSeg < 60) {
                            tiempoPantalla = '$tConcentracionSeg';
                            tConcentracionSeg--;
                          } else {
                            int m = tConcentracionSeg ~/ 60;
                            int s = tConcentracionSeg - (60 * m);
                            if (s < 10) {
                              tiempoPantalla = '$m:0$s';
                            } else {
                              tiempoPantalla = '$m:$s';
                            }
                            tConcentracionSeg--;
                          }

                          if (tConcentracionSeg < 11) {
                            animacionActual = 'FinFocus';
                          }
                        });
                      });
                    }

                    break;

                  case 2: //relax
                    {
                      setState(() {
                        botonDeshabilitado = true;
                        resetDeshabilitado = false;
                        animacionActual = 'LoopRelax';
                      });
                      tDescansoSeg = (widget.tDescanso * 60);
                      Timer.periodic(Duration(seconds: 1), (t) {
                        setState(() {
                          if (tDescansoSeg < 1 || revisarTiempoDes == true) {
                            t.cancel();
                            revisarTiempoDes = false;
                            tiempoPantalla =
                                '${widget.tConcentracion.toString()}:00';
                            botonDeshabilitado = false;
                            resetDeshabilitado = true;

                            if (tConcentracionSeg < 1) {
                              startState = 1;
                              tipoActividad = "Focus";
                              kindActivity = false;
                              tiempoPantalla =
                                  '${widget.tConcentracion.toString()}:00';
                              if (contador < 4) {
                                contador++;
                              }
                            }
                          } else if (tDescansoSeg < 60) {
                            tiempoPantalla = '$tDescansoSeg';
                            tDescansoSeg--;
                          } else {
                            int m = tDescansoSeg ~/ 60;
                            int s = tDescansoSeg - (60 * m);
                            if (s < 10) {
                              tiempoPantalla = '$m:0$s';
                            } else {
                              tiempoPantalla = '$m:$s';
                            }
                            tDescansoSeg--;
                          }

                          if (tDescansoSeg < 11) {
                            animacionActual = 'FinRelax';
                          }
                        });
                      });
                    }

                    break;

                  case 3:
                    {
                      setState(() {
                        botonDeshabilitado = true;
                        resetDeshabilitado = false;
                      });

                      tDescansoSeg = (30 * 60);
                      Timer.periodic(Duration(seconds: 1), (t) {
                        setState(() {
                          if (tDescansoSeg < 1 || revisarTiempoDes == true) {
                            t.cancel();
                            revisarTiempoDes = false;
                            tiempoPantalla =
                                '${widget.tConcentracion.toString()}:00';
                            botonDeshabilitado = false;
                            resetDeshabilitado = true;

                            if (tConcentracionSeg < 1) {
                              startState = 1;
                              tipoActividad = "Focus";
                              kindActivity = false;
                              tiempoPantalla =
                                  '${widget.tConcentracion.toString()}:00';
                              contador = 0;
                            }
                          } else if (tDescansoSeg < 60) {
                            tiempoPantalla = '$tDescansoSeg';
                            tDescansoSeg--;
                          } else {
                            int m = tDescansoSeg ~/ 60;
                            int s = tDescansoSeg - (60 * m);
                            if (s < 10) {
                              tiempoPantalla = '$m:0$s';
                            } else {
                              tiempoPantalla = '$m:$s';
                            }
                            tDescansoSeg--;
                          }
                        });
                      });
                    }

                    break;

                  default:
                }
              }),
        ),
      ],
    );
  }

  //Alerta
  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      //para cerrar cuano se de click
      barrierDismissible: true,
      builder: (context) {
        //que se mostrara?
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.teal[200],
          elevation: 25,
          title: Text(
            '\t\t Felicidade :',
            style: TextStyle(fontSize: 30, color: Colors.blue[900]),
          ),
          //contenido de la alerta
          content: Column(
            //tamaño minimo de los elementos
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Haz realizado 5 Pomodoros seguidos',
                style: TextStyle(fontSize: 20.5, color: Colors.indigo[900]),
              ),
              Text(
                'Te recordamos dividir esta meta en una más pequeña para disminuir la carga ',
                style: TextStyle(fontSize: 20, color: Colors.indigo[900]),
              ),
              Text(
                '¿Nos tomamos un decaso de 30 minutos ',
                style: TextStyle(fontSize: 20.5, color: Colors.indigo[900]),
              ),
              Image.asset(
                'assets/AlertImage.png',
                fit: BoxFit.cover,
                height: 170,
              )
            ],
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  //para regresar a la pantalla de metas
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'Subdividir',
                  style: TextStyle(fontSize: 24, color: Colors.lightBlue[800]),
                )),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  //estado que realiza la cuenta de 30 min
                  startState = 3;
                  print("Se mando al starState 3");
                });
              },
              child: Text(
                'Descansar',
                style: TextStyle(fontSize: 24, color: Colors.lightBlue[700]),
              ),
            )
          ],
        );
      },
    );
  }
}
