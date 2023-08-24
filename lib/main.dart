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
  String result = 'Click the button';

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
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = '✊';
                    });
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = '✌️';
                    });
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = '🖐';
                    });
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
