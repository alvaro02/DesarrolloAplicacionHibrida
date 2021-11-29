import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                'Cotiza',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    color: Color(
                      0XDD000000,
                    )),
              ),
              Text(
                'Tu automovil',
                style: TextStyle(fontSize: 30, color: Color(0XFFD32F2F)),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Ingrese su nombre completo"),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                    return "Por favor ingrese un nombre";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Ingrese su email"),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                          .hasMatch(value!)) {
                    return "Por favor ingrese un email correcto";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Ingrese su numero de telefono"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese numero correcto";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Enviar",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 22,
                        color: Color(0XFFEF5350),
                      )),
                  NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final snackBar =
                              SnackBar(content: Text('Enviando Formulario'));
                          _scaffoldKey.currentState!.showSnackBar(snackBar);
                        }
                      },
                      style: NeumorphicStyle(
                          lightSource: LightSource.topLeft,
                          shape: NeumorphicShape.flat,
                          color: Colors.black,
                          boxShape: NeumorphicBoxShape.circle()),
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
