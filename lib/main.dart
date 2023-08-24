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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Janken'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                print('✊');
              },
              child: const Text('✊'),
            ),
            ElevatedButton(
              onPressed: () {
                print('✌️');
              },
              child: const Text('✌️'),
            ),
            ElevatedButton(
              onPressed: () {
                print('🖐');
              },
              child: const Text('🖐'),
            ),
          ],
        ),
      ),
    );
  }
}
