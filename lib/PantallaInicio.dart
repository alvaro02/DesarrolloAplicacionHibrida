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
            Positioned(
                child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                padding: EdgeInsets.only(right: 15, left: 5, top: 50, bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200)
                  )
                ),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Los mejores autos',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        letterSpacing: 4
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/img/logo.png",
                    width: MediaQuery.of(context).size.width / 1,
                    height: 250,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                ),
                ElevatedButton(
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
