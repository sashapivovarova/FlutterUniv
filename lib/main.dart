import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JanKenPage(),
    );
  }
}

class JanKenPage extends StatefulWidget {
  const JanKenPage({super.key});

  @override
  State<JanKenPage> createState() => _JanKenPageState();
}

class _JanKenPageState extends State<JanKenPage> {
  String myHand = 'Me';
  String computerHand = 'Computer';
  String result = 'Who is the winner?';

  void onClicked(String clickedHand) {
    setState(() {
      myHand = clickedHand;
      generateComputerHand();
      judge();
    });
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '🖐';
      default:
        return '✊';
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = 'Draw';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '🖐' ||
        myHand == '🖐' && computerHand == '✊') {
      result = 'You win!';
    } else {
      result = 'You loose!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Janken'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              computerHand,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'VS',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              myHand,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    onClicked('✊');
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    onClicked('✌️');
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    onClicked('🖐');
                  },
                  child: const Text('🖐'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
