import 'package:dah2021_guajardo/btnNavigarbar.dart';
import 'package:dah2021_guajardo/routes.dart';
import 'package:flutter/material.dart';

class selectorP extends StatefulWidget {
  const selectorP({Key? key}) : super(key: key);

  @override
  State<selectorP> createState() => _selectorPState();
}

class _selectorPState extends State<selectorP> {
  int index = 0;
  btnNavigator? myBtn;

  @override
  void initState() {
    myBtn = btnNavigator(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBtn,
      body: Routes(index: index),
    );
  }
}
