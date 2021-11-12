import 'package:dah2021_guajardo/autos.dart';
import 'package:flutter/material.dart';

class PantallaInicio extends StatefulWidget {
  PantallaInicio({Key? key}) : super(key: key);

  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            lienzoDerecho(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/img/logo.png",
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),
                saludo(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                saludo2(),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Autos()));
                  },
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(13),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget saludo(){
  return Text(
        'Bienvenido a',
        style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 16,
            letterSpacing: 4),
      );
}

Widget saludo2(){
  return Text(
        'Hello RentaCar',
        style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 23,
            letterSpacing: 4),
      );
}

Widget lienzoDerecho() {
  return Positioned(
      child: Align(
    alignment: FractionalOffset.bottomRight,
    child: Container(
      padding: EdgeInsets.only(right: 15, left: 5, top: 50, bottom: 50),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(200))),
      child: lienzoDerechoTexto(),
    ),
  ));
}

Widget lienzoDerechoTexto() {
  return RotatedBox(
    quarterTurns: 3,
    child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Los mejores autos',
        style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 18,
            letterSpacing: 4),
      ),
    ),
  );
}
