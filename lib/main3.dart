import 'package:dah2021_guajardo/pantallaInicio.dart';
import 'package:flutter/material.dart';

void main() => runApp(Inicio());

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello arriendos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PantallaInicio(),
    );
  }
}