import 'package:flutter/material.dart';
import 'package:sample/objectbox.g.dart';
import 'package:sample/model/life_event.dart';
import 'package:sample/page/add_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LifeCounterPage(),
    );
  }
}

class LifeCounterPage extends StatefulWidget {
  const LifeCounterPage({super.key});

  @override
  State<LifeCounterPage> createState() => _LifeCounterPageState();
}

class _LifeCounterPageState extends State<LifeCounterPage> {
  Store? store;
  Box<LifeEvent>? lifeEventBox;
  List<LifeEvent> lifeEvents = [];

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    store = await openStore();
    lifeEventBox = store?.box<LifeEvent>();
    lifeEvents = lifeEventBox?.getAll() ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Life Counter'),
      ),
      body: ListView.builder(
        itemCount: lifeEvents.length,
        itemBuilder: (context, index) {
          final lifeEvent = lifeEvents[index];
          return Text(lifeEvent.title);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const AddLifeEventPage();
        }));
      }),
    );
  }
}
