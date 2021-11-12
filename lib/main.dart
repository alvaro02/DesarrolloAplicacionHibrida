import 'package:flutter/material.dart';

void main() => runApp(RentCar());

class RentCar extends StatelessWidget {
  const RentCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi app',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            lienzoDerechoPosicion(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/img/logo.png",
                    width: MediaQuery.of(context).size.width / 1,
                    height: 230,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),
                texto(),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                botonEntrar()
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget texto() {
  return Container(
    child: Text(
      'Bienvenido a Hello',
      style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontSize: 16,
          letterSpacing: 4),
    ),
  );
}

Widget botonEntrar() {
  return ElevatedButton(
    onPressed: () {},
    child: Icon(
      Icons.chevron_right,
      color: Colors.white,
    ),
    style: ElevatedButton.styleFrom(
      primary: Colors.red,
      shape: CircleBorder(),
      padding: EdgeInsets.all(13),
    ),
  );
}

Widget lienzoDerechoPosicion() {
  return Positioned(
      child: Align(
    alignment: FractionalOffset.bottomRight,
    child: Container(
        padding: EdgeInsets.only(right: 15, left: 5, top: 50, bottom: 50),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(200),
          ),
        ),
        child: lienzoDerecho()),
  ));
}

Widget lienzoDerecho() {
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
