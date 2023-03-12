import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(home: SunPage()));
}

class SunPage extends StatefulWidget {
  const SunPage({super.key});

  @override
  State<SunPage> createState() => SunPageState();
}

class SunPageState extends State<SunPage> {
  double _sunState = 0;
  set sunState(double value) {
    _sunState = max(min(value, 500), 0);
  }

  getGradient() {
    if (_sunState < 100) {
      return [const Color(0xFF90CAF9), const Color(0xFF1E88E5)];
    }
    if (_sunState < 400) {
      return [const Color(0xFFFF8A65), const Color(0xFFF06292)];
    }
    return [const Color(0xFF7B1FA2), const Color(0xFF311B92)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onVerticalDragUpdate: (details) =>
          setState(() => sunState = details.localPosition.dy - 115),
      child: AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: getGradient())),
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(top: 80 + _sunState),
                decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(35)),
              ),
            ],
          )),
    ));
  }
}
