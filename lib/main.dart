import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_key.dart';

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
      home: PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({super.key});

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  List hits = [];

  Future<void> fetchImages(String text) async {
    String path =
        'https://pixabay.com/api/?key=$apiKey=$text&image_type=photo&per_page=100';
    Response response = await Dio().get(path);
    hits = response.data['hits'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchImages('flower');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          initialValue: 'flower',
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
          ),
          onFieldSubmitted: (value) {
            fetchImages(value);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: hits.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> hit = hits[index];
            return Image.network(
              hit['previewURL'],
            );
          },
        ),
      ),
    );
  }
}
