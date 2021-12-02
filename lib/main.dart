import 'package:dah2021_guajardo/pantallaInicio.dart';
import 'package:flutter/material.dart';

void main() => runApp(RentaCar());
class RentaCar extends StatelessWidget {
  const RentaCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent a Car Hello',
      theme: ThemeData(
        primarySwatch: Colors.red,
        ),
        home: PantallaInicio()
    );
  }
}
