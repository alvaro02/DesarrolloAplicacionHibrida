import 'package:flutter/material.dart';

class btnNavigator extends StatefulWidget {
  final Function currentIndex;
  const btnNavigator({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<btnNavigator> createState() => _btnNavigatorState();
}

class _btnNavigatorState extends State<btnNavigator> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
            widget.currentIndex(i);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Correo',
          ),
        ]);
  }
}
