import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SunPage(),
  ));
}

class SunPage extends StatefulWidget {
  const SunPage({super.key});

  @override
  State<SunPage> createState() => SunPageState();
}

class SunPageState extends State<SunPage> {
  double sunState = 0;

  getColor() {
    if (sunState < 33) {
      return Colors.blue[200];
    } else if (sunState < 66) {
      return Colors.deepOrange[300];
    } else {
      return Colors.purple[700];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        duration: const Duration(milliseconds: 500),
        color: getColor(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(top: 50 + sunState * 4),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(25)
              ),
            ),
            Slider(
              value: sunState,
              max: 100,
              activeColor: Colors.black,
              inactiveColor: Colors.white,
              onChanged: (value) => setState(() => sunState = value)
            )
          ],
        ),
      )
    );
  }
}
