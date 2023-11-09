import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: const Text('Doce_Dice_Roll'),
          backgroundColor: Colors.green,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1;
  int rs = 3;
  double turns = 0;
  int rd = 1800;
  bool dicesame = true;

  void rotatedice() {
    setState(() {
      turns += rs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedRotation(
                    turns: turns,
                    duration: Duration(milliseconds: rd),
                    onEnd: ChangeValue,
                    child: TextButton(
                        onPressed: rotatedice,
                        child: Image.asset('images/dice$left.png')),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedRotation(
                    turns: -turns,
                    duration: Duration(milliseconds: rd),
                    onEnd: ChangeValue,
                    child: TextButton(
                        onPressed: rotatedice,
                        child: Image.asset('images/dice$right.png')),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Click the Dice to roll',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          )
        ],
      ),
    );
  }
  void ChangeValue() {
    setState(() {
      left = 1 + Random().nextInt(6);
      right = 1 + Random().nextInt(6);
      dicesame = left == right;
    });
  }
}
