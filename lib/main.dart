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

  final gradients = [
    [
      Colors.blue[200]!,
      Colors.blue[600]!
    ],
    [
      Colors.deepOrange[300]!,
      Colors.pink[300]!
    ],
    [
      Colors.purple[700]!,
      Colors.deepPurple[900]!
    ]
  ];

  getGradient() {
    if (sunState < 33) {
      return gradients[0];
    } else if (sunState < 66) {
      return gradients[1];
    } else {
      return gradients[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: getGradient()
          )
        ),
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
