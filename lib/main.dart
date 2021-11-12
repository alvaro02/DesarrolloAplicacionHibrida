import 'package:dah2021_guajardo/pantallaInicio.dart';
import 'package:flutter/material.dart';

void main() => runApp(RentaCar());
class RentaCar extends StatelessWidget {
  const RentaCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent a Car Hello',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
        home: PantallaInicio()
    );
  }
}
