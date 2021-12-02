import 'package:dah2021_guajardo/autos.dart';
import 'package:dah2021_guajardo/contacto.dart';
import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const Autos(),
      formularioContacto(),
    ];
    return myList[index];
  }
}