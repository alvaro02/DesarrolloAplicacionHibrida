import 'package:flutter/material.dart';

class formularioContacto extends StatefulWidget {
  formularioContacto({Key? key}) : super(key: key);

  @override
  _formularioContactoState createState() => _formularioContactoState();
}

class _formularioContactoState extends State<formularioContacto> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Formulario de Contactato'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              'Cotiza',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25, color: Color(0XDD000000,)),
            ),
            Text(
              'tu automovil',
              style: TextStyle(fontSize: 30, color: Color(0XFFD32F2F)),
            ),
          ],
        ),
      ),
    );
  }
}
